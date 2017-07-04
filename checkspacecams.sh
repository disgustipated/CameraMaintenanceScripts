#!/bin/sh
du -hs /mnt/zfsPool/cam/recording/ | while read output;
do
  echo $output
  usep=$(echo $output | awk '{ print $1}' | cut -d'G' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  echo $usep
  if [ $usep -ge 500 ]; then
    logger "Greater than 500 GB space used \"$partition ($usep%)\" on $(hostname) as on $(date)"
    . /mnt/zfsPool/sys/scripts/deletegramcam.sh
  fi
done
