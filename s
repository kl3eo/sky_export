#!/bin/bash
if [ ! -d ../db_res ]; then
mkdir ../db_res
fi
./k
sleep 3
rsync -az --delete ./rhc_low_sp4/chains/pirl/db/ ../db_res/ 
