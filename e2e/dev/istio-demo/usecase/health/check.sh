#!/usr/bin/bash

watch -n 3 -p "istioctl pc endpoint istio-ingressgateway-647966f79b-sg7sn.istio-system |grep mock"
