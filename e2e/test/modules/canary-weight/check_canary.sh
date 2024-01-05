#!/usr/bin/bash

v1_cnt=0
v2_cnt=0
echo "v1 : v2 = 1 : 4"
while true
do
  res=$(curl -s mockserver.canary)
  if echo $res|grep v1>/dev/null;then
    let v1_cnt++
  fi
  if echo $res|grep v2>/dev/null;then
    let v2_cnt++
  fi
  echo "--------"
  echo "v1:"$v1_cnt
  echo "v2:"$v2_cnt
  sleep .2
done