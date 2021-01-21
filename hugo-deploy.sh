#!/bin/bash

echo -e "Deploying updates to GitHub..."

###
# BUILD THE PROJECT
###
hugo

###
# CD TO PUBLIC FOLDER
###
cd public

###
# ADD CHANGES TO GIT
###
git add .

###
# COMMIT CHANGES
###
msg="rebuilding site `date`"

if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

###
# PUSH CHANGES
###
git push origin master

###
# CD TO PROJECT ROOT
###
cd ..
