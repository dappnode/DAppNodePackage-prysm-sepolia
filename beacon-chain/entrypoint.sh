#!/bin/bash


exec -c beacon-chain \
  --sepolia \
  --accept-terms-of-use \
  --datadir=/data \
  --rpc-host=0.0.0.0 \
  --grpc-gateway-host=0.0.0.0 \
  --monitoring-host=0.0.0.0 \
  --p2p-local-ip=0.0.0.0 \
  --p2p-tcp-port=$P2P_TCP_PORT
  --p2p-udp-port=$P2P_UDP_PORT
  --http-web3provider=$HTTP_WEB3PROVIDER \
  --grpc-gateway-port=3500 \
  --jwt-secret=/jwtsecret \
  --grpc-gateway-corsdomain=$CORSDOMAIN \
  $EXTRA_OPTS