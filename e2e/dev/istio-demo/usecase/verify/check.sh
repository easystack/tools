#!/usr/bin/bash

# delay加流量镜像复合场景，验证发起请求后2s左右返回，并且客户端的sidecar日志显示请求向v1发起，服务端v2日志显示有请求到达。

pod_client=`kubectl get po -ntest|grep testclient|awk '{print $1}'`
date +"%Y-%m-%d %H:%M:%S"
echo "do request"
kubectl exec -it ${pod_client} -ntest -- curl -s mockserver -o /dev/null -w "%{http_code}\n"
date +"%Y-%m-%d %H:%M:%S"
kubectl -ntest logs ${pod_client} -c istio-proxy|grep v1
pod_v2=`kubectl get po -ntest|grep mockserver-v2|awk '{print $1}'`
kubectl -ntest logs ${pod_v2}|grep GET