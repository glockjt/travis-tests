#!/bin/sh

BRANCH_TO_COMPARE="$*"

git remote set-branches --add origin main
git fetch

GIT_DIFF=($(git --no-pager diff --name-only origin/main...$BRANCH_TO_COMPARE))

NEXT_DIRTY=""
MOBILE_DIRTY=""
NODE_DIRTY=""

for file in "${GIT_DIFF[@]}"
do
    if [[ $file == "next"* ]]
    then
        NEXT_DIRTY="yes"
    fi

    if [[ $file == "mobile"* ]]
    then
        MOBILE_DIRTY="yes"
    fi

    if [[ $file == "node"* ]]
    then
        NODE_DIRTY="yes"
    fi
done

# echo NEXT_DIRTY $NEXT_DIRTY
# echo NODE_DIRTY $NODE_DIRTY
# echo MOBILE_DIRTY $MOBILE_DIRTY

# if [[ ! -z "$GIT_DIFF" ]]
# then
#     if [[ $GIT_DIFF == *"next"* ]]
#     then
#         PROJECTS_CHANGED="next"
#         NEXT_DIRTY="yes"
#     fi

#     if [[ $GIT_DIFF == "mobile"* ]]
#     then
#         MOBILE_DIRTY="yes"
#         [[ ! -z "$PROJECTS_CHANGED" ]] && PROJECTS_CHANGED="${PROJECTS_CHANGED}/mobile" || PROJECTS_CHANGED="mobile"
#     fi

#     if [[ $GIT_DIFF == *"node"* ]]
#     then
#         NODE_DIRTY="yes"
#         [[ ! -z "$PROJECTS_CHANGED" ]] && PROJECTS_CHANGED="${PROJECTS_CHANGED}/node" || PROJECTS_CHANGED="node"
#     fi
#     # echo $PROJECTS_CHANGED
# else
#   echo "none"
# fi