#!/usr/bin/bash

kubectl get po -nmockserver|grep v1|awk '{print $1}'|xargs kubectl -nmockserver delete po
