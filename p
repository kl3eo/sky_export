#!/bin/bash
ps aux | grep -E '(pirl_|polkadot-)' | grep -v grep | awk '{printf "%s %s\n", $2, $11}'
