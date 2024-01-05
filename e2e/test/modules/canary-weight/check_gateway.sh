#!/usr/bin/bash
if [ -z "$1" ];then
  echo "please input host"
  exit 1
fi
node_ip=`kubectl get node -owide|grep mas0|awk '{print $6}'`
ingress_gateway_ip=`kubectl get svc -nservicemesh istio-ingressgateway|awk '{print $4}'|grep 172`
cp /istio-check/binshan.pem ~/.ssh/binshan.pem
chmod 600 ~/.ssh/binshan.pem
while true
do
  res=$( ssh -i ~/.ssh/binshan.pem escore@${node_ip} "curl -s -HHost:$1 ${ingress_gateway_ip} -o /dev/null -w \"%{http_code}\\n\"")
  echo "host: $1"
  echo "return code: $res"
  sleep .5
done