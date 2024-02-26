# sky_export

Run './start_low.sh' as a non-root user to start a node.

Change the script 'start_low.sh' and add a custom node name as " --name your_custom_node_name" insert before "> /dev/null 2>&1 &" ending.

Check the telemetry to see your node shows there. (https://telemetry.polkadot.io/#list/0xfacdcefab28407f5b0e56899e1eefe27a5a7fda2a1c25f4e9a5a181eb108ee9e)

Script "./p" shows a list of running nodes.

Script "./d" prints the size of current database.

Script "./k" kills all running nodes.

Script "./s" saves a copy of the database from current folder into the upper folder "../db_res/".

Script "./r" restores the database in current folder from the upper folder "../db_res/".
