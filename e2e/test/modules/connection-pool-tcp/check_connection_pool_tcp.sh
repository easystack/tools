#!/usr/bin/bash

ip=`kubectl get po -nmockserver -owide|grep v1|awk '{print $6}'`
#ns=istio-system
ns=servicemesh
cnt=0
while true
do
  curl -s -HHost:www.mockserver.com 127.0.0.1 -o /dev/null -w "%{http_code}\n"|grep -v 200 
  let cnt=cnt+1
  if [ $cnt -eq 200 ];then
    break
  fi
done
kubectl get po -n${ns} |grep istio-ingressgateway|awk '{print $1}'|\
	head -n 1|xargs kubectl -n${ns} exec -t \
	{} -- netstat -ant|grep -c ${ip}

#!/bin/bash

echo "limit http connection to 1"
sleep 2

temp_file=$(mktemp)

for i in $(seq 1 20); do
        response=$(curl -s mockserver.istiotest-4 -o /dev/null -w "%{http_code}\n")
done

wait

ip=kubectl get po -nistiotest-4 -owide|grep v1|awk '{print $6}'
check_pod=kubectl get po -nistiotest-2 |grep check-box|awk '{print $1}'|head -n 1

count=kubectl -nistiotest-2 exec -it $check_pod -c istio-proxy -- netstat -ant|grep -c $ip
timestamp=$(date +"%m-%d %H:%M")
rm "$temp_file"
if (($count == 10)); then
    echo "$timestamp [connection_pool_http] succeed 503 count $count" >> /host-tmp/istiotest.log
else
    echo "$timestamp [connection_pool_http] error 503 count $count" >> /host-tmp/istiotest.log
fi