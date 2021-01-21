#!/bin/bash

###
# ADD GITKEEP
###
find . \( -type d \) -and \( -not -regex ./\.git.* \) -exec touch {}/.gitkeep \;
