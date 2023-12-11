#!/usr/bin/bash

kubectl delete ns test
cnt=0
while true
do
    if [ $cnt -ge 60 ];then
        echo "delete namespace timeout!"
        kubectl get ns|grep test
        exit 1
    fi
    sleep 2
    if kubectl get ns|grep test>/dev/null;then
        let cnt++
        echo "wait for the namespace test to be deleted. $cnt"
        continue
    fi
    break
done
echo "remove namespace success."