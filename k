#/bin/bash
ps aux | grep "polkadot-" | grep -v grep | awk {'print $2'} | xargs kill -9 $1 > /dev/null 2>&1
