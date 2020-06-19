#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset

brew update

brew upgrade

#Version Manager
brew install asdf
#Markdown Viewer
brew install grip
brew install neovim

#Procfile Supervisor
brew install overmind

brew install zsh

brew install coreutils gpg

# Nicer rebase tool
# `git revise <SHA>` will include the changes that are stage
# into the commit and rebase everything accordingly
brew install git-revise
