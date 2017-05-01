#!/bin/bash

# A drop-in script for pushing a built docker image to our private artifact repository from Travis

# Optional Environmental Variables:
# * ARTIFACTORY_DEPLOY_USER - the ci user that has write capabilities to the docker registry
#
# Required Environmental Variables to run:
# * ARTIFACTORY_DEPLOY_KEY - the api key for the above user

# This script would usually be executed during the deploy step of a travis build process and usually only
# on tagged releases from Github.

# Example travis usage:
#
# before_deploy:
#   - git clone git@github.com:CreditCardsCom/pipeline-scripts.git
#
# deploy:
#   provider: script
#   script: pipeline-scripts/docker/publish.sh
#   skip_cleanup: true
#   on:
#     tags: true


ARTIFACTORY_DEPLOY_USER=${ARTIFACTORY_DEPLOY_USER:-ci-deploy-user}
DOCKER_REPO='packages.creditcards.com:5001'
NAME="postgres"
IMAGE_NAME="$DOCKER_REPO/$NAME"

docker login -u $ARTIFACTORY_DEPLOY_USER -p $ARTIFACTORY_DEPLOY_KEY $DOCKER_REPO
docker build -t $IMAGE_NAME:$TRAVIS_TAG -t $IMAGE_NAME:latest .
docker push $IMAGE_NAME
