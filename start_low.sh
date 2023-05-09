#!/bin/bash

where_i_am=`pwd`

if [ -f rhc.json.bz2 ]; then
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$where_i_am/glibc-2.28/lib/ ./bzip2 -d ./rhc.json.bz2
fi
if [ -f polkadot-0.9.32_low.bz2 ]; then
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$where_i_am/glibc-2.28/lib/ ./bzip2 -d ./polkadot-0.9.32_low.bz2
fi

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$where_i_am/glibc-2.28/lib/ $where_i_am/glibc-2.28/lib64/ld-linux-x86-64.so.2 $where_i_am/polkadot-0.9.32_low --chain $where_i_am/rhc.json --base-path $where_i_am/rhc_low_sp4/ --bootnodes /ip4/81.25.50.12/tcp/30336/p2p/12D3KooWEEzYKGanCaeQUuLCNPYk9oPfqYv6ApRXokd77QCiYmnD --bootnodes /ip4/38.242.141.1/tcp/30337/p2p/12D3KooWAdoye6wpG72de5cAG2ZqcoH5CyAbcukxLxt2aP2XtH3K --ws-port 9944 --rpc-port 9933 --validator --telemetry-url 'wss://telemetry.polkadot.io/submit 0' > /dev/null 2>&1 &
