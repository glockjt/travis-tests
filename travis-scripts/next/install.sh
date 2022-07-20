#!/bin/sh

echo "install"
echo $NEXT_DIRTY

if [[ $NEXT_DIRTY ]]
then
  echo "next install script"
  cd $TRAVIS_BUILD_DIR/$NEXT_PATH
  travis_retry yarn
fi
