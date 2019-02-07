#!/usr/bin/env bash

VAR_ENV=${DEPLOY_ENV:="dev"}
CMD="npm run $VAR_ENV:watch"
SRC_FOLDER="$HOME/project"
CURRENT_DIR=`pwd`
echo "Environment is $VAR_ENV"

cd $SRC_FOLDER

[[ ! -d "$SRC_FOLDER/node_modules" ]] && \
  echo "node_modules not found, installing packages" && \
  npm install;

echo "Starting $CMD"
exec $CMD
