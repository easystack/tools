#!/usr/bin/bash
if [ -z "$1" ];then
  echo "please input param_for_hash"
  exit 1
fi

v1_cnt=0
v2_cnt=0
echo "param_for_hash=$1"
echo "url: http://mockserver.lb-consistent-hash?param_for_hash=$1"
sleep 2
while true
do
  res=$(curl -s mockserver.lb-consistent-hash?param_for_hash=$1)
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