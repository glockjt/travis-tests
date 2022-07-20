#!/bin/sh

echo "script"
echo $NODE_DIRTY

if [[ $NODE_DIRTY ]]
then
  echo "node script"
fi
