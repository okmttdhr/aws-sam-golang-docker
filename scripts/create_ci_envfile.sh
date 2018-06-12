#!/bin/sh

if [ ${CIRCLE_BRANCH} == "master" ]; then
  export Stage=stg
  export StackName=mmm-aws-sam-golang-docker-stg
elif [ ${CIRCLE_BRANCH} == "release" ]; then
  export Stage=prod
  export StackName=mmm-aws-sam-golang-docker-prod
fi

env | sort | grep AWS_ > .env
cat .env
exit 0
