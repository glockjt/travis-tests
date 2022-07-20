#!/bin/sh

BRANCH_TO_COMPARE="$*"

git remote set-branches --add origin main
git fetch

GIT_DIFF=$(git --no-pager diff --name-only origin/main...$BRANCH_TO_COMPARE)
# GIT_DIFF=$(git --no-pager diff --name-only develop...develop)
PROJECTS_CHANGED="parent"

printf $GIT_DIFF

if [[ ! -z "$GIT_DIFF" ]]
then
    if [[ $GIT_DIFF == *"next"* ]]
    then
        PROJECTS_CHANGED="next"
        NEXT_DIRTY="yes"
    fi

    if [[ $GIT_DIFF == *"mobile"* ]]
    then
        MOBILE_DIRTY="yes"
        [[ ! -z "$PROJECTS_CHANGED" ]] && PROJECTS_CHANGED="${PROJECTS_CHANGED}/mobile" || PROJECTS_CHANGED="mobile"
    fi

    if [[ $GIT_DIFF == *"node"* ]]
    then
        NODE_DIRTY="yes"
        [[ ! -z "$PROJECTS_CHANGED" ]] && PROJECTS_CHANGED="${PROJECTS_CHANGED}/node" || PROJECTS_CHANGED="node"
    fi
    echo $PROJECTS_CHANGED
else
  echo "none"
fi