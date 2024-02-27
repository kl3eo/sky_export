#!/bin/bash
if [ ! -d ../db_res ]; then
exit
fi
./k
sleep 3
mkdir -p rhc_low_sp4/chains/pirl/db
rsync -az --delete ../db_res/ ./rhc_low_sp4/chains/pirl/db/
