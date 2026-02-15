.PHONY: regtest-up regtest-down server-run regtest proto bitcoin-init

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

# Helper to start everything
regtest: regtest-up server-run

# Initialize regtest chain (mine 150 blocks)
bitcoin-init:
	./scripts/bitcoin.sh init

# Generate Dart gRPC stubs from protos
proto:
	@echo "Generating Dart gRPC stubs..."
	protoc -I protos --dart_out=grpc:protocol/lib/src/generated protos/mpc_wallet.proto
