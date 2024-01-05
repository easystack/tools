#!/usr/bin/bash

echo "mirror to v2"
sleep 2
v1_cnt=0
v2_cnt=0
while true
do
  res=$(curl -s mockserver.istiotest-19)
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
kubectl get po -nistiotest-19|grep v2|awk '{print $1}'|xargs kubectl -nistiotest-19 logs
