#!/bin/sh

echo "install"
echo $NODE_DIRTY

if [[ $NODE_DIRTY ]]
then
  echo "node install script"
  # yarn global serverless
  cd $NODE_PATH
  # travis_retry yarn
  # yarn download-pem
fi
