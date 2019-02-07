#!/usr/bin/env bash

set -e

DC="docker-compose"
SERVICE="frontend"
WORKDIR="/home/user/project"

echo "Executing command: $@"
CMD="cd $WORKDIR && exec "$@""
$DC exec $SERVICE /bin/bash -c "$CMD"