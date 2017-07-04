#!/bin/sh
find /mnt/zfsPool/cam/recording/ -mindepth 1 -mtime +7 -delete
logger "Done clearing space from security cameras"
return 0
