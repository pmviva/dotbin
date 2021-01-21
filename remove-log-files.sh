#!/bin/bash

###
# REMOVE UNNEEDED LOG FILES
###
echo "Removing unneeded log files..."

find '/var/log' \( -type f \) -and \( -not -regex '.*\(anaconda\|journal\).*' \) -and \( -regex '.*[.-]\([0-9]+\|old\)' \) -exec rm {} \;

###
# TRUNCATE LOG FILES
###
echo "Truncating log files..."

find '/var/log' \( -type f \) -and \( -not -regex '.*\(anaconda\|journal\).*' \) -exec truncate --size=0 {} \;
