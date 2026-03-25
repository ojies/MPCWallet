#!/usr/bin/env bash
# Initialize the arkd (ASP) wallet for regtest.
# Run after `docker compose -f docker-compose.yml -f docker-compose.ark.yml up -d`.
#
# Usage: ./scripts/arkd_init.sh [--fund]
#   --fund  Also fund the ASP wallet with 10 BTC from bitcoind

set -euo pipefail

ARKD_ADMIN="http://localhost:7071"
ARKD_PUBLIC="http://localhost:7070"
BITCOIN_RPC="http://admin1:123@127.0.0.1:18443/wallet/default"

echo "==> Waiting for arkd admin API..."
for i in $(seq 1 30); do
  if curl -sf "$ARKD_ADMIN/v1/admin/wallet/seed" > /dev/null 2>&1; then
    break
  fi
  echo "  Attempt $i/30..."
  sleep 2
done

echo "==> Getting wallet seed..."
seed=$(curl -sf "$ARKD_ADMIN/v1/admin/wallet/seed" | jq -r '.seed')
if [ -z "$seed" ] || [ "$seed" = "null" ]; then
  echo "ERROR: Could not get seed from arkd"
  exit 1
fi
echo "  Seed: ${seed:0:20}..."

echo "==> Creating wallet..."
create_result=$(curl -sf -X POST "$ARKD_ADMIN/v1/admin/wallet/create" \
  -H "Content-Type: application/json" \
  -d "{\"seed\": \"$seed\", \"password\": \"password\"}" 2>&1) || true
echo "  $create_result"

sleep 1

echo "==> Unlocking wallet..."
curl -sf -X POST "$ARKD_ADMIN/v1/admin/wallet/unlock" \
  -H "Content-Type: application/json" \
  -d '{"password": "password"}'

sleep 1

echo "==> Server info:"
curl -sf "$ARKD_PUBLIC/v1/info" | jq .

echo "==> Wallet status:"
curl -sf "$ARKD_ADMIN/v1/admin/wallet/status" | jq .

if [ "${1:-}" = "--fund" ]; then
  echo "==> Funding ASP wallet..."
  asp_address=$(curl -sf "$ARKD_ADMIN/v1/admin/wallet/address" | jq -r '.address')
  echo "  ASP address: $asp_address"

  # Fund via bitcoind RPC
  txid=$(curl -sf -X POST "$BITCOIN_RPC" \
    -H "Content-Type: text/plain" \
    -d "{\"jsonrpc\":\"1.0\",\"id\":\"fund\",\"method\":\"sendtoaddress\",\"params\":[\"$asp_address\", 10]}" \
    | jq -r '.result')
  echo "  Funded: $txid"

  # Mine a block to confirm
  miner_addr=$(curl -sf -X POST "$BITCOIN_RPC" \
    -H "Content-Type: text/plain" \
    -d '{"jsonrpc":"1.0","id":"addr","method":"getnewaddress","params":["","bech32m"]}' \
    | jq -r '.result')
  curl -sf -X POST "$BITCOIN_RPC" \
    -H "Content-Type: text/plain" \
    -d "{\"jsonrpc\":\"1.0\",\"id\":\"mine\",\"method\":\"generatetoaddress\",\"params\":[1, \"$miner_addr\"]}" > /dev/null
  echo "  Mined 1 block"

  sleep 2
  echo "==> Wallet status after funding:"
  curl -sf "$ARKD_ADMIN/v1/admin/wallet/status" | jq .
fi

echo "==> arkd initialization complete!"
