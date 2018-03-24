#!/bin/bash
#
#Usage:
# spaces_to_underscores.sh DIRECTORY
#DIRECTORY is the directory where to look for files to rename.
#
# This script renames all files in DIRECTORY whose filename contain whitespaces
# files in DIRECTORY. It does so by replacing groups adjacent whitespaces with a
# single underscore (_).
#
# Copyright (c) 2018 Antonio Gutierrez

function usage() {
    cat <<EOF
Usage:
 ${0} DIRECTORY
DIRECTORY is the directory where to look for files to rename

Renames all files in DIRECTORY by replacing adjacent whitespaces in the filename with an underscore (_) 
EOF
}

# Check for required argument
if [[ $# -ne 1 ]]; then
    usage
    exit 1
fi

# Make sure we can search in the given directory.
if [[ $(ls -1 ${1} &> /dev/null ; echo $?) -ne 0 ]]; then
    echo Cannot search ${1} directory. Check directory permissions.
    exit 1
fi

# Get all the files from that directory
files=$(ls -1 ${1})
# Used for printing message when no files were renamed
changed_something=0
# Necessary to make newlines the only separator in for-each loop
IFS=$'\n' 
for file in ${files}; do
    newfile=$(echo ${file} | sed 's/ \+/_/g')
    if [[ "${file}" != "${newfile}" ]]; then
        changed_something=1
        mv ${file} ${newfile}
        echo Changed ${file} to ${newfile}
    fi
done

if [[ ${changed_something} -eq 0 ]]; then
    echo No files with spaces. No files renamed. 
fi
