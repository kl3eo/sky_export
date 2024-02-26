#!/bin/bash
if [ ! -d ../db_res ]; then
exit
fi
./k
sleep 3
rsync -az --delete ../db_res/ ./rhc_low_sp4/chains/pirl/db/
