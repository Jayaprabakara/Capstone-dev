#!/bin/bash

echo "$DOCKER_Credentials_PASSWORD" | docker login -u "$DOCKER_Credentials_USERNAME" --password-stdin

if [[ "$GIT_BRANCH" == "origin/dev" ]]; then
    docker tag mywebserver jayaprabakara/dev:latest
    docker images
    docker push jayaprabakara/dev
elif [[ "$GIT_BRANCH" == "origin/master" ]]; then
    docker tag mywebserver jayaprabakara/prod:latest
    docker images 
    docker push jayaprabakara/prod
else
    echo "It is not a GIT push request."
    exit 0
fi
