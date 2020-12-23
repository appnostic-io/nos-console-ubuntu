# nosticOS Ubuntu Console
This is a docker image for nosticOS intended to provide a console front-end for the operating system.

It is based on a very minimalistic Ubuntu (20.04) image with minimal tooling to support the operating system.  It also includes a (proper) in-container init system for more advanced usage.

## Usage
Although this image *may* work as a standalone container some of its internals rely on mounts passed to it from the host as well as operating in a privileged mode.

However for basic useage you could try
```shell
docker run -it --rm appnostic/nos-console-ubuntu /sbin/init -- /bin/bash -l
```
This should instantiate the container and place you inside a shell.

For more advanced usage you may need to mount and bind certain paths from the host to bring about your intended objectives.

## Credits
Much of this is based on the excellent initiative of [phusion](https://github.com/phusion/baseimage-docker) who took great care and effort in constructing a solid Ubuntu container and working through the multiple challenges.  Our hearftfelt thanks and appreciation for your efforts!