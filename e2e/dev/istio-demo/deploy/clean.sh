#!/usr/bin/bash

kubectl delete ns istio-check
kubectl delete ns canary
kubectl delete ns fault-injection
kubectl delete ns connection-pool
kubectl delete ns outlier-detection
kubectl delete ns lb-consistent-hash
kubectl delete ns mirror
kubectl delete ns timeout
kubectl delete ns retry
kubectl delete ns ratelimit-local
kubectl delete ns dubbo-demo
kubectl delete ns spring-demo