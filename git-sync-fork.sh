#!/bin/sh

###
# DEFINE UPSTREAM
###
UPSTREAM=$1

###
# DEFINE REPOSITORY
###
REPOSITORY=$2

###
# PRINT USAGE
###
usage() {
  echo "Usage:"
  echo "$0 <upstream-remote> <target-remote>"
  echo ""
  echo "Example which ensures remote named 'origin' have all the same branches and tags as 'upstream'"
  echo "$0 upstream origin"
  exit 1
}

###
# VALIDATE UPSTREAM
###
if [ -z "$UPSTREAM" ]
then
  echo "Missing upstream remote name."
  usage
fi

###
# VALIDATE REPOSITORY
###
if [ -z "$REPOSITORY" ]
then
  echo "Missing target remote name."
  usage
fi

###
# FETCH ALL REMOTES
###
echo "Fetching all remotes"

git fetch --all

###
# ASK CHECKOUT MASTER BRANCH AND MERGE
###
read -p "1. This will checkout master branch and merge from '$UPSTREAM/master' - Are you sure?" -n 1 -r

###
# CHECKOUT MASTER AND MERGE
###
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "\n"
  git checkout master
  git merge $UPSTREAM/master
fi

###
# ASK TO TRACK ALL BRANCHES IN UPSTREAM
###
read -p "2. This will setup '$REPOSITORY' to track all branches in '$UPSTREAM' - Are you sure ?" -n 1 -r

###
# TRACK ALL BRANCHES
###
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "\n"
  for brname in `git branch -r | grep "$UPSTREAM" | grep -v master | grep -v HEAD | sed -e 's/.*\///g'`; do git branch --track $brname  $UPSTREAM/$brname ; done
fi

###
# ASK TO PUSH ALL LOCAL BRANCHES AND TAGS
###
read -p "3. This will push all local branches and tags into '$REPOSITORY' - Are you sure ?" -n 1 -r

###
# PUSH ALL BRANCHES AND TAGS
###
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "\n"
  git push --all $REPOSITORY
  git push --tags $REPOSITORY
fi
