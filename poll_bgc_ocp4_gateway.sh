#!/bin/bash

URL=$(kubectl get route istio-ingressgateway -n istio-system --output 'jsonpath={.status.ingress[].host}')/api

echo $URL

while true
do 
  # output = $eval("curl -s $URL | jq -r '.pod'")
  curl -s $URL
  echo 
  sleep .4;
done

