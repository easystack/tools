#!/usr/bin/bash

echo "delay 2s"
echo "return 503"
curl -s mockserver.fault-injection -vvv

#!/bin/bash

COUNT=0
while [ $COUNT -lt 3 ]; do
  sleep 1
  headers=$(mktemp)
  out=$(curl -s mockserver.istiotest-6 -o /dev/null -w "%{http_code} %{time_total}\n")
  status=$(echo "$out" | awk '{print $1}')
  response_time=$(echo "$out" | awk '{print $2}')
  timestamp=$(date +"%m-%d %H:%M")

  if [[ $status == "403" ]]; then
    if (( $(awk -v t=$response_time 'BEGIN {if (t>=10 && t<=12) print 1; else print 0}') )); then
      echo "$timestamp [fault-injection] succeed (Status: $status) (Response Time: ${response_time}s)" >> /host-tmp/istiotest.log
    else
      echo "$timestamp [fault-injection] error (Status: $status) (Response Time: ${response_time}s)" >> /host-tmp/istiotest.log
    fi
  else
    echo "$timestamp [fault-injection] error (Status: $status) (Response Time: ${response_time}s)" >> /host-tmp/istiotest.log
  fi

  rm "$headers"
  ((COUNT++))
done