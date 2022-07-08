#!/bin/bash

if [[ -n $WEB3_BACKUP ]] && [[ $EXTRA_OPTS != *"--fallback-web3provider"* ]]; then
  EXTRA_OPTS="--fallback-web3provider=${WEB3_BACKUP} ${EXTRA_OPTS}"
fi

exec -c beacon-chain \
  --sepolia \
  --accept-terms-of-use \
  --datadir=/data \
  --genesis-state=/genesis.ssz \
  --rpc-host=0.0.0.0 \
  --grpc-gateway-host=0.0.0.0 \
  --monitoring-host=0.0.0.0 \
  --p2p-local-ip=0.0.0.0 \
  --p2p-tcp-port=$P2P_TCP_PORT
  --p2p-udp-port=$P2P_UDP_PORT
  --http-web3provider=$HTTP_WEB3PROVIDER \
  --suggested-fee-recipient=$FEE_RECIPIENT \
  --grpc-gateway-port=3500 \
  --jwt-secret=/jwt.hex \
  --terminal-total-difficulty-override=$TTD_OVERRIDE \
  --grpc-gateway-corsdomain=$CORSDOMAIN \
  $EXTRA_OPTS