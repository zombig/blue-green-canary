#!/bin/bash

URL=$(kubectl get route istio-ingressgateway -n istio-system --output 'jsonpath={.status.ingress[].host}')/hello

echo $URL

while true
do 
  curl $URL
  echo
  sleep .3;
done

