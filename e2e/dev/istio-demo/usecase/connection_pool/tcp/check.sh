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
	istio-ingressgateway-647966f79b-szwhb -- netstat -ant|grep -c ${ip}
