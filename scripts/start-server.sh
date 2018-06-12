#!/bin/sh
set -e

until ls -l /var/opt/main; do
  >&2 echo "go build is not done. - sleeping"
  sleep 2
done

>&2 echo "go build is done - executing command"
env | sort
sam local start-api --docker-volume-basedir "${VOLUME}/" --host 0.0.0.0 --template template.yml
