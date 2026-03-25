# Solving Ark's Liveness Problem with Threshold Cosigning

## What I'm Working On

I've been building out an MPC wallet specifically designed to address what I
see as the biggest UX blocker in the Ark protocol — the **interactivity
requirement during Batch Swap rounds**.

This is still a work in progress, but the core primitives are in place and I
wanted to share where things stand and get your feedback on the direction.

## The Problem

Ark scales Bitcoin by batching user payments into **Batch Outputs** — single
on-chain UTXOs partitioned into multiple **Virtual Transaction Outputs
(VTXOs)**. Each Batch Output is an n-of-n multisig between all VTXO owners
and the **Ark Operator (ASP)**, with two spend paths:

- **Collaborative path**: VTXO owner + Operator co-signature
- **Unilateral exit path**: owner-only withdrawal after a CSV timelock

The problem is that every Batch Output has an **expiry timestamp**. Before it
expires, each VTXO owner must either:

1. Participate in a new **Batch Swap** round — atomically rolling their VTXO
   into a fresh Batch Output, or
2. Perform a **unilateral on-chain withdrawal**

**If the user does neither, the Ark Operator reclaims the Batch Output to
recover their fronted liquidity.** The user's VTXO gets swept.

This means users **must be online and interactive** at regular intervals. For
a consumer wallet — where someone might not open the app for weeks — that's a
fundamental problem. It effectively limits Ark to power users who are
actively managing their VTXOs.

## The Approach

The idea behind this wallet is straightforward: **what if a cosigner could
handle the Batch Swap on the user's behalf while they're offline?**

I'm building a **FROST (Flexible Round-Optimized Schnorr Threshold
Signatures)** based wallet with a 2-of-3 threshold split between the user's
device, a **cosigner running as a WASM component inside a secure enclave**,
and a recovery key. Any two of the three shares can produce a valid BIP-340
Schnorr signature — but no single party can sign alone.

When a VTXO approaches expiry, the cosigner — which is always online — would:

1. Detect the approaching expiry window
2. Enter the Batch Swap round with the ASP on behalf of the user
3. Co-sign the **forfeit transaction** releasing the old VTXO using its FROST
   share
4. Receive the refreshed VTXO in the new Batch Output

The user's funds roll forward. No app open. No interaction. No swept VTXOs.

## Why This Isn't Custodial

This is the thing I keep coming back to — the cosigner **cannot unilaterally
move funds**. It holds one share of a 2-of-3 threshold key. Spending requires
any two of the three shares. The security model breaks down like this:

| Scenario | Outcome |
|---|---|
| User online, cosigner online | Normal collaborative signing — payments, batch swaps |
| User offline, cosigner online | Cosigner refreshes VTXOs autonomously — funds safe |
| User online, cosigner offline | User performs unilateral exit via CSV timelock |
| Both offline | Unilateral exit remains available until VTXO expiry |

The cosigner is sandboxed in **per-user WASM isolation** (Wasmtime). Each
user gets their own memory-isolated instance — no shared state, no cross-user
leakage.

## Where Things Stand

The cryptographic foundation is working. Here's what's built so far:

**Done:**
- FROST 2-of-3 DKG (3-round key generation) and threshold signing
- WASM cosigner component running in per-user sandboxed isolation
- Authenticated gRPC transport with Schnorr-signed requests and replay
  protection
- Taproot key tweaking and BIP-340 signature support

**Still working on:**
- Ark taproot primitives — BIP-341 complian t VTXO taptree construction with
  forfeit leaf + CSV exit leaf
- Forfeit and exit spend info derivation (scripts + control blocks)
- P2TR script pubkey derivation using NUMS internal key
- Cosigner Ark bindings — exposing VTXO operations through the WIT interface
- Batch Swap protocol handler — the service that monitors VTXO expiry
  timelines and initiates refresh rounds with the ASP
- Cosigner policy scoping — constraining autonomous signing to VTXO refresh
  only, never outbound transfers without the client
- ASP integration layer — communication with the Ark Operator for round
  participation and VTXO state sync
- Client-side notifications when a refresh is performed on the user's behalf

## Architecture

```
┌──────────────────────────────────────────────────────┐
│                   User's Device                       │
│                                                       │
│  ┌─────────────┐    ┌──────────────────────────────┐ │
│  │ Client App  │    │  FROST Key Share (client)     │ │
│  │ (Dart)      │───►│  Signs when user is active    │ │
│  └─────────────┘    └──────────────────────────────┘ │
└──────────────────────────┬───────────────────────────┘
                           │ gRPC (authenticated)
                           ▼
┌──────────────────────────────────────────────────────┐
│              Server (Secure Enclave)                  │
│                                                       │
│  ┌────────────────────────────────────────────────┐  │
│  │         WASM Sandbox (per-user instance)        │  │
│  │                                                  │  │
│  │  ┌──────────────────────────────────────────┐   │  │
│  │  │  Cosigner (FROST Key Share)               │   │  │
│  │  │  - Produces signature shares              │   │  │
│  │  │  - Derives VTXO script pubkeys            │   │  │
│  │  │  - Computes forfeit/exit spend info       │   │  │
│  │  │  - Participates in Batch Swap rounds      │   │  │
│  │  └──────────────────────────────────────────┘   │  │
│  └────────────────────────────────────────────────┘  │
│                         │                             │
│                         ▼                             │
│              ┌─────────────────────┐                 │
│              │   Ark Operator /    │                 │
│              │   ASP Interface     │                 │
│              └─────────────────────┘                 │
└──────────────────────────────────────────────────────┘
```

## What I'd Like Feedback On

1. **Trust model** — Are we comfortable with the cosigner having scoped
   authority to refresh VTXOs autonomously? The policy engine would strictly
   limit it to refresh-only signing, but I want to make sure the trust
   assumptions sit right.

2. **Priority** — The Ark liveness problem is well-known but no one seems to
   be solving it at the wallet layer. As far as I can tell, every existing
   approach either accepts the interactivity burden or falls back to full
   custody. Is this worth prioritizing?

3. **Scope** — The remaining work (ASP integration, policy scoping, batch
   swap handler) is non-trivial but bounded. Happy to put together a more
   detailed roadmap if this direction makes sense.

Would love your thoughts.
