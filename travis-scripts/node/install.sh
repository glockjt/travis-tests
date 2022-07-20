#!/bin/sh

if [[ $NODE_DIRTY == *"node"* ]]
then
  echo "node install script"
  # yarn global serverless
  cd $NODE_PATH
  # travis_retry yarn
  # yarn download-pem
fi
