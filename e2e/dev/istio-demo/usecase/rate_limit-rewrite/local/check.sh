#!/usr/bin/bash

while true
do
  date +"%X"
  curl -s -HHost:www.mockserver.com 127.0.0.1  -o /dev/null -w "%{http_code}\n"
  sleep 2
done
