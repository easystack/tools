#!/usr/bin/bash

echo "limit http connection to 1"
sleep 2
while true
do
  curl -s mockserver.connection-pool -o /dev/null -w "%{http_code}\n"|grep 5 &
  sleep .002
done