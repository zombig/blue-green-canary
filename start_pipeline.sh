#!/bin/bash

tkn pipeline start bgc-build-deploy \
 --param="mavenMirrorUrl=http://nexus.rhd-workshop-infra:8081/nexus/content/groups/public"  \
 --resource="appSource=bgc-git-source" \
 --resource="appImage=bgc-image" \
 --serviceaccount="pipeline"