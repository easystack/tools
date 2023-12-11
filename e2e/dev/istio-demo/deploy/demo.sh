#!/usr/bin/bash

# istio-check
kubectl create ns istio-check
kubectl label ns istio-check istio-injection=enabled

kubectl -n istio-check apply -f ./check

# canary
kubectl create ns canary
kubectl label ns canary istio-injection=enabled

kubectl -n canary apply -f ./origin
kubectl -n canary apply -f ../usecase/canary/gw.yaml
kubectl -n canary apply -f ../usecase/canary/vs.yaml


# fault-injection
kubectl create ns fault-injection
kubectl label ns fault-injection istio-injection=enabled

kubectl -n fault-injection apply -f ./origin
kubectl -n fault-injection apply -f ../usecase/fault/vs.yaml

# connection-pool
kubectl create ns connection-pool
kubectl label ns connection-pool istio-injection=enabled

kubectl -n connection-pool apply -f ./origin
kubectl -n connection-pool apply -f ../usecase/connection_pool/http/dr.yaml

# outlier-detection
kubectl create ns outlier-detection
kubectl label ns outlier-detection istio-injection=enabled

kubectl -n outlier-detection apply -f ../usecase/health/dr.yaml
kubectl -n outlier-detection apply -f ../usecase/health/prism-conf.yaml
kubectl -n outlier-detection create -f ./origin

# lb-consistent_hash
kubectl create ns lb-consistent-hash
kubectl label ns lb-consistent-hash istio-injection=enabled

kubectl -n lb-consistent-hash apply -f ./origin
kubectl -n lb-consistent-hash apply -f ../usecase/lb-consistent_hash/consistent_hash/dr_param.yaml

# mirror
kubectl create ns mirror
kubectl label ns mirror istio-injection=enabled

kubectl -n mirror apply -f ./origin
kubectl -n mirror apply -f ../usecase/mirror/vs.yaml

# timeout
kubectl create ns timeout
kubectl label ns timeout istio-injection=enabled

kubectl -n timeout apply -f ./origin
kubectl -n timeout apply -f ../usecase/timeout/vs.yaml

# retry
kubectl create ns retry
kubectl label ns retry istio-injection=enabled

kubectl -n retry apply -f ../usecase/retry/vs.yaml
kubectl -n retry apply -f ../usecase/retry/prism-conf.yaml
kubectl -n retry create -f ./origin

# ratelimit-local
kubectl create ns ratelimit-local
kubectl label ns ratelimit-local istio-injection=enabled

kubectl -n ratelimit-local apply -f ./origin
kubectl -n ratelimit-local apply -f ../usecase/rate_limit-rewrite/local/vs.yaml
kubectl -n ratelimit-local apply -f ../usecase/rate_limit-rewrite/local/filter-local-ratelimit-svc-envoyfilter-all.yaml

# dubbo-demo
kubectl create ns dubbo-demo
kubectl label ns dubbo-demo istio-injection=enabled

kubectl -n dubbo-demo apply -f ../usecase/dubbo/zk.yaml
kubectl -n dubbo-demo apply -f ../usecase/dubbo/provider.yaml
kubectl -n dubbo-demo apply -f ../usecase/dubbo/consumer.yaml

# spring-demo
kubectl create ns spring-demo
kubectl label ns spring-demo istio-injection=enabled

kubectl -n spring-demo apply -f ../usecase/spring/eureka.yaml
kubectl -n spring-demo apply -f ../usecase/spring/provider.yaml
kubectl -n spring-demo apply -f ../usecase/spring/consumer.yaml