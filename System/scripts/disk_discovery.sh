#!/bin/bash

disk_array=(`grep -E "(vd[a-z]$|sd[a-z]$)" /proc/partitions | awk '{print $4}'`)
length=${#disk_array[@]}
printf "{\n"
printf  '  '"\"data\":["
for ((i=0;i<$length;i++))
do
  printf '\n    {'
  printf "\"{#DISK_NAME}\":\"${disk_array[$i]}\"}"
  if [ $i -lt $[$length-1] ];then
    printf ','
  fi
done
printf  "\n  ]\n"
printf "}\n"
