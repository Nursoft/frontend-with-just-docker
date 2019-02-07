#!/usr/bin/env bash

set -e

HERE=`pwd`
USER=`whoami`
USERID=`id -u $USER`
DC="docker-compose"
SERVICE="frontend"

[[ `systemctl is-active docker` == "inactive" ]] && \
  echo "docker is disabled, enabling" && \
  sudo systemctl start docker

for OPTION in $@; do
  case "$OPTION" in
    --clean)
      [[ -d "$HERE/project/node_modules" ]] && \
        echo "Deleting node_modules by request (--clean)" && \
        rm -rf ./project/node_modules
      ;;
  esac
done

echo "Starting development container, leave this terminal open to reflect changes."

$DC build --build-arg=USERID=$USERID -e DEPLOY_ENV=$DEPLOY_ENV $SERVICE
$DC up
