#!/bin/bash

echo 'Containers'

kubectl get pod $1 -o yaml | yq r - spec.containers[*].name

echo 'Init Containers'

kubectl get pod $1 -o yaml | yq r - spec.initContainers[*].name