#!/usr/bin/bash

while true
do
  curl -s -HHost:www.mockserver.com 127.0.0.1 -o /dev/null -w "%{http_code}\n"|grep 5 &
  sleep .002
done
