.PHONY: regtest-up regtest-down server-run server-run-bg regtest regtest-hardware proto bitcoin-init signer-build signer-run signer-stop pico-build pico-flash pico-test flutter-run threshold-ffi-build threshold-rs-test threshold-ffi-test e2e-test

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
	-pkill -f "signer-server" || true

# Run the MPC Server attached to the Regtest environment
# Using host networking for Docker on Linux implies 127.0.0.1 works
# ELECTRUM_URL=127.0.0.1 ELECTRUM_PORT=50001 (mapped in docker-compose)
server-run:
	@echo "Starting MPC Server..."
	export ELECTRUM_URL=127.0.0.1 && \
	export ELECTRUM_PORT=50001 && \
	export BITCOIN_RPC_USER=admin1 && \
	export BITCOIN_RPC_PASSWORD=123 && \
	dart server/bin/server.dart

# Build the hardware signer test server
signer-build:
	@echo "Building Hardware Signer Test Server..."
	export PATH="$$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin:$$PATH" && \
	cd signer-server && cargo build --release

# Run the hardware signer test server (background, default port 9090)
signer-run: signer-build
	@echo "Starting Hardware Signer Test Server on port 9090..."
	export PATH="$$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin:$$PATH" && \
	cd signer-server && cargo run --release -- --port 9090 &
	@sleep 2

# Stop the hardware signer test server
signer-stop:
	@echo "Stopping Hardware Signer Test Server..."
	-pkill -f "signer-server" || true

# Helper to start everything (includes hardware signer test server)
regtest: regtest-up bitcoin-init signer-run server-run

# Initialize regtest chain (mine 150 blocks)
bitcoin-init:
	./scripts/bitcoin.sh init

# Run MPC Server in background
server-run-bg:
	@echo "Starting MPC Server (background)..."
	@export ELECTRUM_URL=127.0.0.1 && \
	export ELECTRUM_PORT=50001 && \
	export BITCOIN_RPC_USER=admin1 && \
	export BITCOIN_RPC_PASSWORD=123 && \
	dart server/bin/server.dart &
	@sleep 2
	@echo "MPC Server running in background."


# Hardware device setup: regtest + ADB reverse + server (bg), then run flutter separately
regtest-hardware: regtest-up bitcoin-init adb-reverse server-run
	@echo ""
	@echo "==> Backend ready. Now run Flutter in a separate terminal:"
	@echo "    cd ap && flutter run"

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

# Build threshold FFI shared library
threshold-ffi-build:
	@echo "Building threshold-ffi..."
	cd threshold-ffi && cargo build --release
	@echo "Built: threshold-ffi/target/release/libthreshold_ffi.so"

# Run threshold-rs tests
threshold-rs-test:
	@echo "Running threshold-rs tests..."
	cd threshold-rs && cargo test --features std

# Run threshold-ffi tests
threshold-ffi-test:
	@echo "Running threshold-ffi tests..."
	cd threshold-ffi && cargo test

# Run the full E2E test (requires Docker running)
e2e-test: threshold-ffi-build signer-run
	@echo "Running E2E test..."
	cd e2e && dart test test/full_system_test.dart
	-pkill -f "signer-server" || true

# Generate Dart gRPC stubs from protos
proto:
	@echo "Generating Dart gRPC stubs..."
	protoc -I protos --dart_out=grpc:protocol/lib/src/generated protos/mpc_wallet.proto
