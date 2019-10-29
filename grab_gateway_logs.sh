#!/bin/bash

kubectl -n istio-system logs -l app=istio-ingressgateway -p > ../gateway_logs_prev.txt
kubectl -n istio-system logs -l app=istio-ingressgateway > ../gateway_logs_last.txt
