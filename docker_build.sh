#!/bin/sh


if [ "$TRAVIS_BRANCH" == "dev" ];
then
    export TAG=$TRAVIS_BRANCH
    docker login -u $DOCKER_ID -p $DOCKER_PASSWORD
    docker pull $DOCKER_ID/$USERS:$TAG
    docker pull $DOCKER_ID/$USERS_DB:$TAG
    docker pull $DOCKER_ID/$CLIENT:$TAG
    docker pull $DOCKER_ID/$SWAGGER:$TAG
    docker pull $DOCKER_ID/$NGINX:$TAG
fi

docker-compose -f docker-compose-stage.yml up -d --build
