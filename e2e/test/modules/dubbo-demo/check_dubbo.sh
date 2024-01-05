#!/usr/bin/bash

echo "send request to dubbo consumer"
sleep 1
echo "return code: "`curl -s http://dubbo-sample-consumer.dubbo-demo:8383/hello?name=xxb -o /dev/null -w "%{http_code}\n"`
curl "http://dubbo-sample-consumer.dubbo-demo:8383/hello?name=xxb"|cut -d 'c' -f 1