#!/bin/bash

###
# ADD EMPTY
###
find . \( -type d \) -and \( -not -regex ./\.git.* \) -exec touch {}/.empty \;
