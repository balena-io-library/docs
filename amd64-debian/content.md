# What is Debian?

Debian is an operating system which is composed primarily of free and open-source software, most of which is under the GNU General Public License, and developed by a group of individuals known as the Debian project. Debian is one of the most popular Linux distributions for personal computers and network servers, and has been used as a base for several other Linux distributions.

> [wikipedia.org/wiki/Debian](https://en.wikipedia.org/wiki/Debian)

%%LOGO%%

# About this image

The `debian:latest` tag will always point the latest stable release (which is, at the time of this writing, `debian:jessie`). Stable releases are also tagged with their version (ie, `debian:8` is an alias for `debian:jessie`, `debian:7` is an alias for `debian:wheezy`, etc).

The mirror of choice for these images is [the deb.debian.org CDN pointer/redirector](https://deb.debian.org) so that it's as reliable as possible for the largest subset of users (and is also the default mirror for `debootstrap` as of [2016-10-20](https://anonscm.debian.org/cgit/d-i/debootstrap.git/commit/?id=9e8bc60ad1ccf3a25ce7890526b70059f3e770de)). See the [deb.debian.org homepage](https://deb.debian.org) for more information.

## How It's Made

This image is built on top of official Debian docker image. If you are curious about what goes into creating this image, please see [debian](https://hub.docker.com/_/debian/).