#!/bin/bash

echo "$(date '+%Y-%m-%d %H:%M:%S') - Das System ist gestartet" >> /var/log/auto_start.log

/home/fabi/studium/Hof/Semester\ 1/Betriebsysteme/scripts/auto_update.sh 
