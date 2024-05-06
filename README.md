# sky_export

Run './start_low.sh' as a non-root user to start a node in this folder.

Change the script 'start_low.sh' and add a custom node name: insert " --name your_custom_node_name" before "> /dev/null 2>&1 &".

NB: if you're copying existing folder "sky_export" as "exportN" - DO NOT FORGET: remove the file "./exportN/rhc_low_sp4/chains/pirl/network/secret_ed25519" - this file then will be created automatically on the node's next start. If you have the same file "secret_ed25519" for many nodes, only one will sync, all the others won't, because this file should be unique for each node.

NB: Also DO NOT FORGET: edit every "start_low.sh" in every new folder and change the name of the node (see above how to), also add "+1" to every port number "9944" and "9933", in folder "export1" ports they are 9944 and 9933, in folder "export2" they are 9945 and 9934, and so on, until in folder "export8" they are 9940 and 9951.

NB: After the long hours first time sync, save a copy of the fully synced node database with "./s" script (see all scripts below). Before saving, make sure your database is "clean", i.e., it has no garbage from the sync. To remove the garbage, just stop the node, then start it and wait 1-2 min while the node auto-cleans its database. While it's doing so, you run "./d" script to watch the database size. When you see its size has dropped drastically (for example, from ~6G to just 2.2G), it means the cleaning has completed. The "clean" database without garbage is always minimal in size. May 2024, it's ~2.2 GB. It grows about 100MB each month.

NB: sometimes your node(s) will lose sync. You can see it "dimmed" in the telemetry, and its current blockHeight is low. All you need to do is stop this node, then run "./r" script ("r" = "restore"). It will restore the previously saved "clean" copy of the database from the upper level folder "~/db_res". Then start the node again and wait till it syncs, but this time, FROM THE last block of the saved copy. Do not sync again from "zero" from the block chain, because you have a saved copy of the good database already.

Check the telemetry to see your nodes show up there -  https://telemetry.polkadot.io/#list/0xfacdcefab28407f5b0e56899e1eefe27a5a7fda2a1c25f4e9a5a181eb108ee9e - NB: this telemetry board would only show SOME nodes SOME times, not every node ALWAYS. So, if you don't see your node there, just come try later.

NB: when your node is not visible in the telemetry, you can check its current blockHeight with command: 
curl --connect-timeout 1 --max-time 1 --silent -H "Content-Type: application/json" -d '{"id":1, "jsonrpc":"2.0", "method": "system_syncState"}' http://localhost:9933/ | jq -r '.result' | jq -r '.currentBlock'

# scripts

Script "./p" shows a list of running nodes.

Script "./d" prints the size of current database.

Script "./k" kills all running nodes.

Script "./s" saves a copy of the database from the current folder into the upper level folder "../db_res/".

Script "./r" restores the database in the current folder from the upper level folder "../db_res/".

Script "./sta.sh" starts all nodes in folders ~/export1 ... ~/export8.

Script "./check_cb.pl" prints current blockHeight for each of the running nodes.

Script "./crontab" stops all nodes and re-starts them next minute once every hour. Good for auto-clean of the database. Run command "crontab -e" then copy/paste text from this file, change "nobody" to your user's name, and minutes 52/53 to whichever is good for you.
