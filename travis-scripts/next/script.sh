#!/bin/sh

echo "script"
echo $NEXT_DIRTY

if [[ $NEXT_DIRTY ]]
then
  echo "next script"
fi
