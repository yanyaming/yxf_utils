#!/bin/sh
#goto project root
curpath=$(cd "$(dirname "$0")"; pwd)
cd $curpath
nohup ./frps -c ./frps.ini > frps_console.log 2>&1 &
exit 0
