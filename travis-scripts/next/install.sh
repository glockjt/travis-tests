#!/bin/sh

echo "install"
echo $NEXT_DIRTY

if [[ $NEXT_DIRTY ]]
then
  echo "next install script"
  cd $NEXT_PATH
  travis_retry yarn
fi
