#!/usr/bin/bash

v1_cnt=0
v2_cnt=0
while true
do
  res=$(curl -s -HHost:www.mockserver.com 127.0.0.1?param_for_hash=my_param)
  if [ "$res" = "v1" ];then
    let v1_cnt++
  fi
  if [ "$res" = "v2" ];then
    let v2_cnt++
  fi
  echo "--------"
  echo "v1:"$v1_cnt
  echo "v2:"$v2_cnt
  sleep .2
done
