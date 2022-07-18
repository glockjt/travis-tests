#!/bin/sh

BRANCH_TO_COMPARE="$*"

echo $(git remote -v)
GIT_DIFF=$(git --no-pager diff --name-only main...$BRANCH_TO_COMPARE)
# GIT_DIFF=$(git --no-pager diff --name-only develop...develop)
PROJECTS_CHANGED=""
# echo $GIT_DIFF
if [[ ! -z "$GIT_DIFF" ]]
then
    if [[ $GIT_DIFF == *"next"* ]]
    then
        PROJECTS_CHANGED="next"
    fi

    if [[ $GIT_DIFF == *"mobile"* ]]
    then
        [[ ! -z "$PROJECTS_CHANGED" ]] && PROJECTS_CHANGED="${PROJECTS_CHANGED}/mobile" || PROJECTS_CHANGED="mobile"
    fi

    if [[ $GIT_DIFF == *"node"* ]]
    then
        [[ ! -z "$PROJECTS_CHANGED" ]] && PROJECTS_CHANGED="${PROJECTS_CHANGED}/node" || PROJECTS_CHANGED="node"
    fi
    echo $PROJECTS_CHANGED
else
  echo "test"
fi