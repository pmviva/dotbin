#!/bin/bash

###
# ADD GITIGNORE
###
find . \( -type d \) -and \( -not -regex ./\.git.* \) -exec touch {}/.gitignore \;
