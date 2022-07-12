#!/bin/bash

if [[ -n $FEE_RECIPIENT ]] && [[ $EXTRA_OPTS != *"--suggested-fee-recipient"* ]]; then
  EXTRA_OPTS="--suggested-fee-recipient=${FEE_RECIPIENT} ${EXTRA_OPTS}"
fi


exec -c beacon-chain \
  --datadir=/data \
  --sepolia \
  --rpc-host=0.0.0.0 \
  --grpc-gateway-host=0.0.0.0 \
  --grpc-gateway-port=3500 \
  --grpc-gateway-corsdomain=$CORSDOMAIN \
  --p2p-local-ip=0.0.0.0 \
  --http-web3provider=$HTTP_WEB3PROVIDER \
  --p2p-tcp-port=$P2P_TCP_PORT \
  --p2p-udp-port=$P2P_UDP_PORT  \
  --accept-terms-of-use \
  --jwt-secret=/jwt.hex \
  --terminal-total-difficulty-override=$TTD_OVERRIDE \
  --genesis-state=genesis.ssz \
  $EXTRA_OPTS
