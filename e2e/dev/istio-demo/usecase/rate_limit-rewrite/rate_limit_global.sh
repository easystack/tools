#!/bin/bash

c=0
c1=0
interval=2
code=""
d1=""
while true;
do 
    let c=c+1
    code1=`curl -s   -HHost:mockserver.com -Haa:bb -Hbb:bbb -Hcc:ccc 127.0.0.1/mockserver -o /dev/null -w "%{http_code}\n"`
    if [ "$code" != "$code1" ];then
	    echo "start at $d1"
	    echo "code changed"
	    echo "current: $code1"
	    echo -n "$code count: "
	    echo "$c-$c1"|bc
	    echo "interval: $interval"
	    echo -n "persistent time(about): "
	    echo "($c-$c1)*$interval"|bc
	    d1=`date +%X`
	    echo "end at $d1"
	    echo "---------------------------"
	    c1=$c
	    code=$code1
    fi
    sleep $interval
done
