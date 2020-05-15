#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

# Checks if the symlink already exists,
# if it does don't create symlink
# Else create a symlink
function symlink_if_missing() {
  FILE=$1
  if [[ -L "$HOME/$FILE" ]]; then
    echo "$FILE already exists, not copying"
  else
    echo "~/$FILE does not exist, symlinking"
    ln -sv $( dirname "${BASH_SOURCE[0]}" )/${FILE} ~
  fi
}

# find all dot files in dot files repo (except .git) and return their file names
files=$(find . -regex "\./\..*" ! -name ".git" -maxdepth 1 | sed s/.\\///)

# Loop over all files found and create a symlink
for file_name in $files
do
  symlink_if_missing $file_name
done
