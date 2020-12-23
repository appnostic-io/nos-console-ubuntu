#!/bin/bash
set -e
source /nos-build/buildconfig
set -x

## Install init process.
cp /nos-build/bin/nos_init /sbin/init
mkdir -p /etc/nos_init.d
mkdir -p /etc/nos_init.pre_shutdown.d
mkdir -p /etc/nos_init.post_shutdown.d
mkdir -p /etc/container_environment
touch /etc/container_environment.sh
touch /etc/container_environment.json
chmod 700 /etc/container_environment

groupadd -g 8377 docker_env
chown :docker_env /etc/container_environment.sh /etc/container_environment.json
chmod 640 /etc/container_environment.sh /etc/container_environment.json
ln -s /etc/container_environment.sh /etc/profile.d/

## Install runit.
$minimal_apt_get_install runit

