#!/usr/bin/bash

echo "limit 5 requests in 10 seconds"
sleep 2
while true
do
  date +"%X"
  curl -s mockserver.ratelimit-local -o /dev/null -w "%{http_code}\n"
  sleep 1
done