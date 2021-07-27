#!/bin/bash

###
# ADD KEEP
###
find . \( -type d \) -and \( -not -regex ./\.git.* \) -exec touch {}/.keep \;
