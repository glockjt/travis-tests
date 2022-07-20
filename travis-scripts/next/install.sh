#!/bin/sh

if [[ $NEXT_DIRTY == *"next"* ]]
then
  echo "next install script"
  cd $NEXT_PATH
  travis_retry yarn
fi
