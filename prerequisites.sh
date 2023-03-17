#!/bin/bash

set -eu -o pipefail

#[[ $(id -u) != 0 ]] && { echo 'Please run as the root user.'; exit 1; }

# Install Node
[ ! -f /etc/apt/sources.list.d/nodesource.list ] && sudo bash -c 'curl -fsSL https://deb.nodesource.com/setup_14.x | bash -'

# Install neovim dependencies
sudo apt install -y \
  g++ \
  gcc \
  git \
  make \
  ncurses-bin \
  nodejs \
  python3 \
  python3-dev \
  python3-pip \
  shellcheck \
  tasksel

if ! command -V nvim &> /dev/null; then
  NEOVIM_TARBALL=https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
  NEOVIM_TARBALL_SHA256=https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz.sha256sum

  for URL in "${NEOVIM_TARBALL}" "${NEOVIM_TARBALL_SHA256}"; do
    curl -fsSLO "${URL}"
  done

  sha256sum -c nvim-linux64.tar.gz.sha256sum &> /dev/null || { echo "SHA256 sum mismatch for neovim download at ${NEOVIM_TARBALL}."; exit 1; }
  tar -xzf nvim-linux64.tar.gz
  for path in $(ls nvim-linux64/); do
	  sudo cp -r ./nvim-linux64/"${path}"/* /usr/"${path}"/
  done

  rm -rf nvim-linux64*
  echo "Installed $(nvim -v | head -n 1)"

fi

# Install Packer
PACKERPATH="${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim"
[ -d "${PACKERPATH}" ] || git clone --depth 1 \
  https://github.com/wbthomason/packer.nvim "${PACKERPATH}"

mkdir -p ~/.config/nvim/
cp -pr init.lua after/ lua/ ~/.config/nvim/
nvim +PackerSync
