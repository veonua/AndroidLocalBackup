#!/bin/bash

saveIFS=$IFS
IFS="/"
var2=($1)
IFS=$saveIFS
ppath="/run/user/1000/gvfs/mtp:host=%5B${var2[1]}%3A${var2[2]}%2C${var2[3]}%5D/Internal storage"
cpath=/home/veon/backup/$2

sleep 10

declare -a arr=("DCIM" "Pictures")
for i in "${arr[@]}"
do
   rsync -a --exclude="cache" --exclude=".*" "$ppath/$i" "$cpath"
done
