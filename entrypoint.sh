#!/bin/bash


NAME=$RUNNER_NAME
TOKEN=$GIT_TOKEN
URL=$GIT_URL


export RUNNER_ALLOW_RUNASROOT=1

./config.sh --name $NAME --url $URL --token $TOKEN --unattended

./run.sh