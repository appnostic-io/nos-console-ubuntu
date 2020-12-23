#!/bin/bash
set -e
source /nos-build/buildconfig
set -x

## Often used tools.
$minimal_apt_get_install curl \
less \
vim-tiny \
psmisc \
gpg-agent \
dirmngr \
net-tools \
dnsutils \
iputils-ping \
iputils-tracepath \
traceroute \
iproute2


ln -s /usr/bin/vim.tiny /usr/bin/vim

## This tool runs a command as another user and sets $HOME.
cp /nos-build/bin/setuser /sbin/setuser

## This tool allows installation of apt packages with automatic cache cleanup.
cp /nos-build/bin/install_clean /sbin/install_clean
