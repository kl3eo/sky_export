#/bin/bash
ps aux | grep "polkadot-0.9.32_low" | grep -v grep | awk {'print $2'} | xargs kill -9 $1
