#!/bin/bash
echo "$DOCKER_USERNAME" | docker login -u "$DOCKER_USERNAME" --password-stdin
 if [ [ "$GIT_BRANCH" == "origin/dev" ]{}; then
        docker tag mywebserver jayaprabakara/dev:latest
        docker images
        docker push jayaprabakara/dev
 elif [[ "$GIT_BRANCH" == "origin/master" ]]; then
        docker tag mywebserver jayaprabakara/prod:latest
        docker images 
        docker push jayaprabakara/prod
 else
    echo " it is not push request "
    exit 0
fi 