#!/bin/bash

echo "[all]" > hosts
cat /etc/hosts|grep node-|awk '{print $2}' >> hosts
export ANSIBLE_HOST_KEY_CHECKING=False

ansible all -i hosts -m script -a "config_registry.sh"
