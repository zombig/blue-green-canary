#!/bin/bash

docker login docker.io

docker tag $1 docker.io/burrsutter/blue-green-canary:canary

docker push docker.io/burrsutter/blue-green-canary:canary
