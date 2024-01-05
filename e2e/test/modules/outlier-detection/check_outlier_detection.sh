#!/usr/bin/bash

echo "v1 503 error, limit 5"
echo "5s interval, 10s baseEjectionTime, 100% maxEjectionPercent"
sleep 3
while true
do
  res=`curl -s mockserver.outlier-detection -o /dev/null -w "%{http_code}\n"`
  if [ "$res" = "503" ];then 
      echo "v1 503"
  fi
  sleep .2
done