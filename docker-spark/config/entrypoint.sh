#!/bin/bash
echo "starting sshd"
/usr/sbin/sshd
echo "started sshd"
echo "starting hadoop"
#/spark/hadoop-3.2.0/sbin/start-all.sh
/spark/hadoop-3.2.0/sbin/start-dfs.sh
/spark/hadoop-3.2.0/sbin/start-yarn.sh
/spark/hadoop-3.2.0/sbin/mr-jobhistory-daemon.sh start historyserver
echo "started hadoop"