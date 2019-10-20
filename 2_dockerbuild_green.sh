#!/bin/bash

docker build -f src/main/docker/Dockerfile.native -t dev.local/burrsutter/blue-green-canary:green .