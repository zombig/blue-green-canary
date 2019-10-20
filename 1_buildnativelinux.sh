#!/bin/bash

GRAALVM_HOME=/Users/burrsutter/tools/graalvm-ce-19.2.0.1/Contents/Home

mvn package -Pnative -Dnative-image.docker-build=true -DskipTests
