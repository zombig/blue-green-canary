#!/bin/bash

kubectl apply -f src/main/istio/Gateway_VS.yml
kubectl create -f src/main/istio/Destination_rule_blue_green.yml