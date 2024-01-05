#!/bin/sh
COUNT=0
# 进入容器
while [ $COUNT -lt 20 ]; do
  sleep 1
  out=$(curl -s http://helloword-svc.istiotest-7:5000/hello)
  timestamp=$(date +"%m-%d %H:%M")
  if [[ $out == *"Hello version: v1"* ]]; then
    echo "$timestamp [gated-launch-to-v1] succeed $out" >> /host-tmp/istiotest.log
  else
    echo "$timestamp [gated-launch-to-v1] error $out"  >> /host-tmp/istiotest.log
  fi
  ((COUNT++))
done