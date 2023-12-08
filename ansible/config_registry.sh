#!/bin/bash

config_file=/etc/containerd/config.toml
cat $config_file | grep gcr.yylt.gq
if [ $? -ne 0 ]; then
   sed -i 's/endpoint = \["https:\/\/registry-1.docker.io"\]/endpoint = \["docker.yylt.gq"\]/g' $config_file
   sed -i '/endpoint = \["https:\/\/hub.ecns.io"\]/a \        [plugins."io.containerd.grpc.v1.cri".registry.mirrors."registry.k8s.io"]\n\          endpoint = ["k8s.yylt.gq"]' $config_file
   sed -i '/endpoint = \["https:\/\/hub.ecns.io"\]/a \        [plugins."io.containerd.grpc.v1.cri".registry.mirrors."gcr.io"]\n\          endpoint = ["gcr.yylt.gq"]' $config_file
   systemctl restart containerd
else
    echo "has configured"
fi