#!/bin/bash

URL=$(minikube -p istio-mk ip):$(kubectl get svc istio-ingressgateway -n istio-system --output 'jsonpath={.spec.ports[?(@.port==80)].nodePort}')/hello

echo $URL

while true
do 
  curl $URL
  echo
  sleep .3;
done

