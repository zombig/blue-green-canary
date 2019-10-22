#!/bin/bash

# oc create -f src/main/tekton/pipeline-resources-openshift-green.yml
# oc apply -f src/main/tekton/task-yq-deploy.yml
# oc apply -f src/main/tekton/task-mvn-buildah.yml
# oc apply -f src/main/tekton/pipeline-skip-build.yml

# oc replace -f src/main/tekton/pipeline-resources-openshift-green.yml
oc replace -f src/main/tekton/task-yq-deploy.yml
oc replace -f src/main/tekton/task-mvn-buildah.yml
oc replace -f src/main/tekton/pipeline-skip-build.yml
