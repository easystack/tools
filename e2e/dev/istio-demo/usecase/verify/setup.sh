#!/usr/bin/bash

kubectl create ns test
kubectl label ns test istio-injection=enabled
kubectl -ntest apply -f ./files
kubectl get svc -ntest
kubectl get po -ntest|grep -v Running

