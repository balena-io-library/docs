# Supported tags and respective `Dockerfile` links

-	[`jessie`, `latest` (*systemd/i386/jessie/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/4f42681c8d6a67fb9ab049d9d79535bac8122d34/systemd/i386/jessie/Dockerfile)
-	[`wheezy` (*systemd/i386/wheezy/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/88d1f519546a3f4535048c356bdf9e4595898033/systemd/i386/wheezy/Dockerfile)

For more information about this image and its history, please see the [relevant manifest file (`resin/i386-systemd`)](https://github.com/resin-io-library/official-images/blob/master/library/i386-systemd) in the [`resin-io-library/official-images` GitHub repo](https://github.com/resin-io-library/official-images).

# What is systemd?

Systemd is a suite of system management daemons, libraries, and utilities designed as a central management and configuration platform for the Linux computer operating system. Described by its authors as a "basic building block" for an operating system, systemd primarily aims to replace the Linux init system (the first process executed in user space during the Linux startup process) inherited from UNIX System V and Berkeley Software Distribution (BSD). The name systemd adheres to the Unix convention of making daemons easier to distinguish by having the letter d as the last letter of the filename.

> [wikipedia.org/wiki/Systemd](https://en.wikipedia.org/wiki/Systemd)

# How to use this image

Systemd can be enabled by adding `ENV INITSYSTEM on` to your Dockerfile below the `FROM <Docker image>` line. This will trigger systemd init system on the Docker image.

## Create a `Dockerfile` in your app project

	FROM resin/i386-systemd:latest
	# Enable systemd
	ENV INITSYSTEM on
	# Your code goes here	

You can then build and run the Docker image:

	docker build -t my-app .
	docker run -it --rm --name my-running-app my-app

# License

 Systemd is published as free and open-source software under the terms of the GNU Lesser General Public License (LGPL) version 2.1 or later.

# Supported Docker versions

This image is officially supported on Docker version 1.9.1.

Support for older versions (down to 1.0) is provided on a best-effort basis.

# User Feedback

## Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/resin-io-library/base-images/issues).

## Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/resin-io-library/base-images/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.
