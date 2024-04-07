#!/bin/bash

echo "$DOCKERHUB_PASSWORD" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin

if [[ "$GIT_BRANCH" == "origin/dev" ]]; then
    docker tag mywebserver jayaprabakara/dev:latest
    docker images
    docker push jayaprabakara/dev
elif [[ "$GIT_BRANCH" == "origin/master" ]]; then
    docker tag mywebserver jayaprabakara/prod:latest
    docker images 
    docker push jayaprabakara/prod
else
    echo "It is not a GIT push or Merge request."
    exit 0
fi
