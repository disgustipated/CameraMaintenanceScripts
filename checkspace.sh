#!/bin/sh
df -H | grep -m 1 -G "\/mnt\/zfsPool" | awk '{print $5 " " $6}' | while read output;
do
  echo $output
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $usep -ge 95 ]; then
    logger "Running out of space \"$partition ($usep%)\" on $(hostname) as on $(date)"
    . /mnt/zfsPool/sys/scripts/deletegramcam.sh
  fi
done
