.PHONY: regtest-up regtest-down server-run regtest proto bitcoin-init signer-build signer-run signer-stop

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

# Generate Dart gRPC stubs from protos
proto:
	@echo "Generating Dart gRPC stubs..."
	protoc -I protos --dart_out=grpc:protocol/lib/src/generated protos/mpc_wallet.proto
