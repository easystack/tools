#!/usr/bin/env bash

ip=$(kubectl get svc -n servicemesh  |awk '/istio-ingressgateway/ {print $3}')
url="$ip/mockserver"
host_header="Host: ratelimit.mockserver.com"
total_requests=1000

declare -A response_codes

for ((i=1; i<=$total_requests; i++)); do
  response=$(curl -s -o /dev/null -w "%{http_code}" -H "$host_header" "$url")
  response_codes[$response]=$(( ${response_codes[$response]} + 1 ))
done
timestamp=$(date +"%m-%d %H:%M")
echo "Response Code Statistics:"
for code in "${!response_codes[@]}"; do
  echo "HTTP $code: ${response_codes[$code]} requests"
  echo "$timestamp [ratelimit-global] HTTP $code: ${response_codes[$code]} requests" >> /host-tmp/istiotest.log
done