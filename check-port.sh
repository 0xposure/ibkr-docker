#!/bin/bash

if [[ ${GATEWAY_OR_TWS@L} = "gateway" ]]; then
    if [[ ${IBC_TradingMode:-live} = "live" ]]; then
        # IBGateway Live
        port=4001
    else
        # IBGateway Paper
        port=4002
    fi
elif [[ ${IBC_TradingMode:-live} = "live" ]]; then
    # TWS Live
    port=7496
else
    # TWS Paper
    port=7497
fi

# Check if both ports are open
if lsof -i :8888 | grep -q LISTEN && lsof -i :${port} | grep -q LISTEN; then
  exit 0
else
  exit 1
fi