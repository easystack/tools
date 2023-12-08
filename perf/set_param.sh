#!/bin/bash
set -x
if [ -z "$1" ];then
  echo "Usage: $0 path_to_directory"
  exit 1
fi

for file in $(find $1/ -type f)
do
  # ns不一样，需修改
  sed -i 's/istio-system/servicemesh/g' "$file"
  # ingressgateway名称不一样，需修改
  sed -i 's/istio: ingressgateway/istio: istio-ingressgateway/g' "$file"
  # 设置代理
  #sed -i 's/gcr.io/gcr.yylt.gq/g' "$file"
done