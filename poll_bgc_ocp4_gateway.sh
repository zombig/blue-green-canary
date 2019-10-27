#!/bin/bash

URL=$(kubectl get route istio-ingressgateway -n istio-system --output 'jsonpath={.status.ingress[].host}')/api

echo $URL

while true
do 
  curl -s $URL | jq -r '.pod'
  echo
  sleep .3;
done

