#!/bin/bash

set -eu -o pipefail

[[ $(id -u) != 0 ]] && { echo 'Please run as the root user.'; exit 1; }

# Install Node
curl -fsSL https://deb.nodesource.com/setup_14.x | bash -

apt install -y
  g++ \
  gcc \
  git \
  make \
  ncurses-bin \
  nodejs \
  npm \
  python3.10-venv \
  python3 \
  shellcheck \
  tasksel

# Install Packer
PACKERPATH='.local/share/nvim/site/pack/packer/start/packer.nvim'
[ ! -f PACKERPATH ] && git clone --depth 1 \
  https://github.com/wbthomason/packer.nvim "${PACKERPATH}"
