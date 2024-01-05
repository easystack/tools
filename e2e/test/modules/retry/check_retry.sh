#!/usr/bin/bash

echo "v1 503 error"
echo "retry 3 times"
sleep 2
echo "return code: "`curl -s mockserver.retry -o /dev/null -w "%{http_code}\n"`

echo "get v1 log"
sleep 2
kubectl get po -nretry|grep v1|awk '{print $1}'|xargs kubectl -nretry logs 