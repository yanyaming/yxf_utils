#!/bin/sh
#goto project root
curpath=$(cd "$(dirname "$0")"; pwd)
cd $curpath
nohup ./frpc -c ./frpc.ini > frpc_console.log 2>&1 &
exit 0
