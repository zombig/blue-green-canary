#!/bin/bash

docker login docker.io

docker tag $1 docker.io/burrsutter/blue-green-canary:green

docker push docker.io/burrsutter/blue-green-canary:green
