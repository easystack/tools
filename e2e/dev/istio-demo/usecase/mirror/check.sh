#!/usr/bin/bash

curl -s -HHost:www.mockserver.com 127.0.0.1  -vvv
kubectl get po -nmockserver|grep v2|awk '{print $1}'|xargs kubectl -nmockserver logs
