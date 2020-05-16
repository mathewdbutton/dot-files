#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset

asdf plugin add ruby || true
asdf plugin add nodejs || true
asdf plugin add python || true

asdf plugin update ruby

asdf install ruby 2.7.1
asdf global ruby 2.7.1
