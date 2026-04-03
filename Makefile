.PHONY: regtest-up regtest-down regtest regtest-hardware regtest-hardware-ark regtest-hardware-ark-down proto bitcoin-init mine-loop signer-build signer-run signer-stop pico-build pico-flash pico-test flutter flutter-run threshold-ffi-build threshold-ffi-android ark-ffi-build threshold-test threshold-ffi-test e2e-test e2e-ark-test cosigner-build server-build server-run server-stop arkd-up arkd-down arkd-init crypto-bench stress-test load-test signet-down signet-hardware-ark e2e-mutinynet

# Stress test data isolation
export DATA_DIR=/tmp/mpc_wallet_stress
# Start Docker environment (Bitcoind + Electrs)
regtest-up:
	@echo "Starting Regtest environment..."
	docker compose up -d
	@echo "Waiting for services to stabilize..."
	@sleep 5

# Stop Docker environment
regtest-down:
	@echo "Stopping Regtest environment..."
	cd e2e && docker compose down
	-sudo pkill -9 -f "signer-server" || true
	-sudo pkill -9 -f "target/release/server" || true
	-sudo pkill -9 -f "server --wasm" || true
	sudo rm -rf /root/.mpc_wallet/server/db || true
	@sleep 2

# Build the hardware signer test server
signer-build:
	@echo "Building Hardware Signer Test Server..."
	-sudo chown -R $(USER):$(USER) e2e/signer-server/target 2>/dev/null || true
	cd e2e/signer-server && cargo build --release

# Run the hardware signer test server (background, default port 9090)
signer-run: signer-build
	@echo "Starting Hardware Signer Test Server on port 9090..."
	cd e2e/signer-server && cargo run --release -- --port 9090 &
	@sleep 2

# Stop the hardware signer test server
signer-stop:
	@echo "Stopping Hardware Signer Test Server..."
	-sudo pkill -9 -f "signer-server" || true
	-sudo pkill -9 signer-server || true
	@sleep 1

# Helper to start everything
regtest: regtest-up bitcoin-init signer-run server-run

# Initialize regtest chain (mine 150 blocks)
bitcoin-init:
	./scripts/bitcoin.sh init

# Mine a block every 10 seconds (Ctrl+C to stop)
mine-loop:
	@echo "Mining a block every 10s (Ctrl+C to stop)..."
	@while true; do ./scripts/bitcoin.sh mine; sleep 10; done

# Hardware device setup: regtest + ADB reverse + mine loop (bg) + server (foreground with logs)
regtest-hardware: regtest-up bitcoin-init adb-reverse cosigner-build server-build threshold-ffi-build threshold-ffi-android ark-ffi-build ark-ffi-android
	@echo "Starting mine loop in background..."
	@(while true; do ./scripts/bitcoin.sh mine 2>/dev/null; sleep 10; done) &
	@echo ""
	@echo "==> Run Flutter in a separate terminal:  cd ap && flutter run"
	@echo "==> Server logs below (Ctrl+C to stop):"
	@echo ""
	export ELECTRUM_URL=127.0.0.1 && \
	export ELECTRUM_PORT=50001 && \
	export BITCOIN_RPC_USER=admin1 && \
	export BITCOIN_RPC_PASSWORD=123 && \
	cd server && cargo run --release -- \
		--wasm ../cosigner/target/wasm32-wasip1/release/cosigner.wasm \
		--port 50051

# Hardware device setup with Ark: regtest + arkd + ADB reverse + mine loop (bg) + server (foreground)
regtest-hardware-ark: cosigner-build server-build threshold-ffi-build threshold-ffi-android ark-ffi-build ark-ffi-android
	@echo "=== Starting regtest + arkd ==="
	docker compose -f docker-compose.yml -f docker-compose.ark.yml up -d
	@echo "Waiting for services to stabilize (10s)..."
	@sleep 10
	@echo "=== Initializing Bitcoin chain ==="
	./scripts/bitcoin.sh init
	@echo "=== Initializing arkd ==="
	./scripts/arkd_init.sh --fund
	@echo "=== Setting up ADB reverse ==="
	-adb reverse tcp:50051 tcp:50051
	-adb reverse tcp:50001 tcp:50001
	@echo ""
	@echo "Starting mine loop in background..."
	@(while true; do ./scripts/bitcoin.sh mine 2>/dev/null; sleep 10; done) &
	@echo ""
	@echo "==> Run Flutter in a separate terminal:  cd ap && flutter run"
	@echo "==> Server logs below (Ctrl+C to stop):"
	@echo ""
	export ELECTRUM_URL=127.0.0.1 && \
	export ELECTRUM_PORT=50001 && \
	export BITCOIN_RPC_USER=admin1 && \
	export BITCOIN_RPC_PASSWORD=123 && \
	export ASP_URL=http://127.0.0.1:7070 && \
	cd server && cargo run --release -- \
		--wasm ../cosigner/target/wasm32-wasip1/release/cosigner.wasm \
		--port 50051

# Stop everything (arkd + regtest + server + mine loop)
regtest-hardware-ark-down:
	@echo "Stopping MPC server..."
	-pkill -f "target/release/server" || true
	@echo "Stopping mine loop..."
	-pkill -f "bitcoin.sh mine" || true
	@echo "Stopping Docker services..."
	docker compose -f docker-compose.yml -f docker-compose.ark.yml down
	@echo "All stopped."

# --- Signet (MutinyNet) ---
# No local bitcoind/electrs/arkd needed -- uses MutinyNet public infra + a remote ASP.
# Set MUTINYNET_ASP_URL to the ASP you want to connect to.

MUTINYNET_ASP_URL ?= http://localhost:7070

# MutinyNet with Ark: MPC server connecting to public MutinyNet + remote ASP (foreground)
signet-hardware-ark: cosigner-build server-build threshold-ffi-build threshold-ffi-android ark-ffi-build ark-ffi-android
	@echo "=== Setting up ADB reverse ==="
	-adb reverse tcp:50051 tcp:50051
	@echo ""
	@echo "==> Run Flutter in a separate terminal:  cd ap && flutter run"
	@echo "==> Server logs below (Ctrl+C to stop):"
	@echo ""
	export ELECTRUM_URL=electrum.mutinynet.com && \
	export ELECTRUM_PORT=50001 && \
	export BITCOIN_NETWORK=signet && \
	export ASP_URL=$(MUTINYNET_ASP_URL) && \
	cd server && cargo run --release -- \
		--wasm ../cosigner/target/wasm32-wasip1/release/cosigner.wasm \
		--port 50051

# Stop MutinyNet MPC server
signet-down:
	@echo "Stopping MPC server..."
	-pkill -f "target/release/server" || true
	@echo "Stopped."

# Run MutinyNet Bitcoin integration test (requires MUTINYNET_FUNDER_KEY env var)
e2e-mutinynet: threshold-ffi-build cosigner-build server-build signer-run
	@echo "Running MutinyNet E2E test..."
	cd e2e && dart test test/mutinynet_e2e_test.dart --timeout 600s
	-pkill -f "signer-server" || true

# Set up ADB reverse port forwarding for physical device
adb-reverse:
	@echo "Setting up ADB reverse port forwarding..."
	adb reverse tcp:50051 tcp:50051
	adb reverse tcp:50001 tcp:50001
	@echo "Forwarding active: phone 127.0.0.1:50051 -> PC gRPC server"
	@echo "Forwarding active: phone 127.0.0.1:50001 -> PC Electrs"

# Build Pico 2 firmware
pico-build:
	@echo "Building Pico Signer firmware..."
	cd pico-signer && cargo build --release

# Flash Pico 2 via debug probe (requires SWD probe connected)
pico-flash-probe: pico-build
	@echo "Flashing via debug probe..."
	cd pico-signer && cargo run --release

# Flash Pico 2 via UF2 bootloader (hold BOOTSEL + plug in USB first)
pico-flash: pico-build
	@echo "Converting ELF to UF2..."
	cp pico-signer/target/thumbv8m.main-none-eabihf/release/pico-signer pico-signer/pico-signer.elf
	picotool uf2 convert pico-signer/pico-signer.elf pico-signer/pico-signer.uf2 --family rp2350-arm-s
	@echo ""
	@echo "==> Created pico-signer/pico-signer.uf2"
	@echo "==> Copy to the RP2350 drive:  cp pico-signer/pico-signer.uf2 /media/$$USER/RP2350/"
	@echo ""
	@if [ -d "/media/$$USER/RP2350" ]; then \
		cp pico-signer/pico-signer.uf2 /media/$$USER/RP2350/ && \
		echo "Copied! Pico will reboot with new firmware."; \
	else \
		echo "RP2350 drive not found. Hold BOOTSEL + plug in the Pico, then run:"; \
		echo "  cp pico-signer/pico-signer.uf2 /media/$$USER/RP2350/"; \
	fi

# Smoke test Pico Signer over USB HID (no phone needed)
pico-test:
	@echo "Testing Pico Signer over USB HID..."
	scripts/.venv/bin/python3 scripts/test_pico.py $(ARGS)

# Build FFI libs for Android and run Flutter app
flutter: threshold-ffi-android ark-ffi-android
	cd ap && flutter run

# Build threshold FFI shared library (desktop)
threshold-ffi-build:
	@echo "Building threshold-ffi..."
	cd threshold-ffi && cargo build --release
	@echo "Built: threshold-ffi/target/release/libthreshold_ffi.so"

# Build ark FFI shared library
ark-ffi-build:
	@echo "Building ark-ffi..."
	cd ark-ffi && cargo build --release
	@echo "Built: ark-ffi/target/release/libark_ffi.so"
# Build threshold FFI for Android (arm64) and bundle into Flutter app
NDK_VERSION ?= 27.0.12077973
NDK_HOME = $(HOME)/Android/Sdk/ndk/$(NDK_VERSION)
threshold-ffi-android:
	@echo "Building threshold-ffi for Android arm64..."
	export PATH="$(NDK_HOME)/toolchains/llvm/prebuilt/linux-x86_64/bin:$$PATH" && \
	cd threshold-ffi && cargo build --release --target aarch64-linux-android
	mkdir -p ap/android/app/src/main/jniLibs/arm64-v8a
	cp threshold-ffi/target/aarch64-linux-android/release/libthreshold_ffi.so \
		ap/android/app/src/main/jniLibs/arm64-v8a/
	@echo "Installed: ap/android/app/src/main/jniLibs/arm64-v8a/libthreshold_ffi.so"

# Build ark FFI for Android (arm64) and bundle into Flutter app
ark-ffi-android:
	@echo "Building ark-ffi for Android arm64..."
	export PATH="$(NDK_HOME)/toolchains/llvm/prebuilt/linux-x86_64/bin:$$PATH" && \
	cd ark-ffi && cargo build --release --target aarch64-linux-android
	mkdir -p ap/android/app/src/main/jniLibs/arm64-v8a
	cp ark-ffi/target/aarch64-linux-android/release/libark_ffi.so \
		ap/android/app/src/main/jniLibs/arm64-v8a/
	@echo "Installed: ap/android/app/src/main/jniLibs/arm64-v8a/libark_ffi.so"

# Run threshold tests
threshold-test:
	@echo "Running threshold tests..."
	cd threshold && cargo test --features std

# Run threshold-ffi tests
threshold-ffi-test:
	@echo "Running threshold-ffi tests..."
	cd threshold-ffi && cargo test

# Run the full E2E test (requires Docker running)
e2e-test: threshold-ffi-build cosigner-build server-build signer-run
	@echo "Running E2E test..."
	cd e2e && dart test test/full_system_test.dart
	-pkill -f "signer-server" || true

# Build WASM cosigner component
cosigner-build:
	@echo "Building cosigner WASM component..."
	cd cosigner && cargo component build --release
	@echo "Built: cosigner/target/wasm32-wasip1/release/cosigner.wasm"

# Build MPC Wallet Server
server-build:
	@echo "Building server..."
	cd server && cargo build --release

# Run MPC Wallet Server (Rust, background, port 50051)
server-run: cosigner-build server-build
	@echo "Starting MPC Wallet Server on port 50051..."
	export ELECTRUM_URL=127.0.0.1 && \
	export ELECTRUM_PORT=50001 && \
	export BITCOIN_RPC_USER=admin1 && \
	export BITCOIN_RPC_PASSWORD=123 && \
	cd server && cargo run --release --bin server -- \
		--wasm ../cosigner/target/wasm32-wasip1/release/cosigner.wasm \
		--port 50051 &
	@sleep 2
	@echo "MPC Wallet Server running in background."

# Stop MPC Wallet Server
server-stop:
	@echo "Stopping MPC Wallet Server..."
	-sudo fuser -k 50051/tcp || true
	-sudo pkill -9 -f "target/release/server" || true
	-sudo pkill -9 -f "server --wasm" || true
	-sudo pkill -9 server || true
	sudo rm -rf $(DATA_DIR) || true
	@sleep 2

# --- Ark (ASP) ---

# Start arkd + dependencies (brings up regtest + ark together)
arkd-up:
	@echo "Starting regtest + arkd (ASP) services..."
	docker compose -f docker-compose.yml -f docker-compose.ark.yml up -d
	@echo "Waiting for arkd to start (30s)..."
	@sleep 30

# Initialize arkd wallet and fund it
arkd-init:
	@echo "Initializing arkd wallet..."
	./scripts/arkd_init.sh --fund

# Stop arkd services (keeps bitcoind/electrs)
arkd-down:
	@echo "Stopping arkd services..."
	docker compose -f docker-compose.yml -f docker-compose.ark.yml down

# Run Ark E2E test (requires arkd running)
e2e-ark-test: threshold-ffi-build ark-ffi-build cosigner-build server-build signer-run
	@echo "Running Ark E2E test..."
	cd e2e && dart test test/ark_e2e_test.dart
	-pkill -f "signer-server" || true

# Generate a new Ark address (requires MPC server + signer-server running)
ark-newaddress:
	@cd e2e && dart run bin/ark_newaddress.dart

# Generate Dart gRPC stubs from protos
proto:
	@echo "Generating Dart gRPC stubs..."
	protoc -I protocol/protos --dart_out=grpc:protocol/lib/src/generated protocol/protos/mpc_wallet.proto

# Run Rust cryptography benchmarks
crypto-bench:
	@echo "Running Rust cryptography benchmarks..."
	cd threshold && cargo bench

# Run multi-user E2E stress test
stress-test: server-stop signer-stop regtest-up bitcoin-init signer-run server-run
	@echo "Running Multi-User E2E Stress Test..."
	cd e2e && dart test test/multi_user_stress_test.dart
	@$(MAKE) server-stop
	@$(MAKE) signer-stop

# Run Dart load tester using real MpcClient + TcpHardwareSigner (like the e2e tests)
# Variables:
#   SESSIONS     – total DKG sessions to complete  (default: 10)
#   CONCURRENCY  – max sessions in flight at once   (default: 5)
#   SIGNER_PORT  – base signer-server TCP port       (default: 9090)
#   SERVER       – gRPC server address               (default: 127.0.0.1:50051)
SESSIONS    ?= 10
CONCURRENCY ?= 5
SIGNER_PORT ?= 9090
SERVER      ?= 127.0.0.1:50051
load-test: server-stop signer-stop regtest-up bitcoin-init signer-run server-run
	@echo "Running Dart Load Tester (sessions=$(SESSIONS), concurrency=$(CONCURRENCY))..."
	cd e2e && dart pub get && \
		dart run bin/load_tester.dart \
			--server $(SERVER) \
			--signer-host 127.0.0.1 \
			--signer-port $(SIGNER_PORT) \
			--sessions $(SESSIONS) \
			--concurrency $(CONCURRENCY)
	@$(MAKE) server-stop
	@$(MAKE) signer-stop
