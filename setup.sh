#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

echo "Running brew init script"
./brew.sh

echo "Installing Oh-my-zsh - NOTE this is probably going to override your .zshrc file"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

./asdf.sh

# Checks if the symlink already exists,
# if it does don't create symlink
# Else create a symlink
function symlink_if_missing() {
  FILE=$1
  if [[ -L "$HOME/$FILE" ]]; then
    echo "$FILE already exists, not copying"
  else
    echo "~/$FILE does not exist, symlinking"
    ln -sv $( pwd )/${FILE} ~
  fi
}

# find all dot files in dot files repo (except .git) and return their file names
files=$(find . -regex "\./\..*" ! -name ".git" -maxdepth 1 | sed s/.\\///)

# Loop over all files found and create a symlink
for file_name in $files
do
  symlink_if_missing $file_name
done
