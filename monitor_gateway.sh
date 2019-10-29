#!/bin/bash

while true
do kubectl -n istio-system get pods -l app=istio-ingressgateway
sleep .3;
done