#!/bin/bash

echo "[all]" > hosts
ssh node-1 kubectl get node -l node-role.kubernetes.io/node=true|grep node-|awk '{print $1}'>>hosts
export ANSIBLE_HOST_KEY_CHECKING=False

ansible all -i hosts -m script -a "config_registry.sh"
