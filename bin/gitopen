
#!/bin/bash

# This script will list all files from a git diff.

# My bash skills are a bit primitive so this can probably be done more intelligently

# Usage:
#   gitopen -- opens all added files that have changed since HEAD
#   gitopen diff HEAD -- these are the default parameters
#   gitopen diff master -- opens files that have changed from master
#   gitopen show -- opens files that were changed in the last revision (HEAD)
#   gitopen show HEAD -- default param, does the same
#   gitopen show 4b3ca34 -- opens a particular REV

COMMAND=diff
REV=HEAD

if [ $1 ]; then
    COMMAND=$1
fi

if [ $2 ]; then
    REV=$2
fi

if [ $COMMAND = "show" ]; then
    PARAM='--pretty=format: --name-only'
else
    PARAM='--name-only'
fi

git $COMMAND $PARAM $REV
