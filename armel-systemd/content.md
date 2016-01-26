# What is systemd?

Systemd is a suite of system management daemons, libraries, and utilities designed as a central management and configuration platform for the Linux computer operating system. Described by its authors as a "basic building block" for an operating system, systemd primarily aims to replace the Linux init system (the first process executed in user space during the Linux startup process) inherited from UNIX System V and Berkeley Software Distribution (BSD). The name systemd adheres to the Unix convention of making daemons easier to distinguish by having the letter d as the last letter of the filename.

> [wikipedia.org/wiki/Systemd](https://en.wikipedia.org/wiki/Systemd)


# How to use this image

Systemd can be enabled by adding `ENV INITSYSTEM on` to your Dockerfile below the `FROM <Docker image>` line. This will trigger systemd init system on the Docker image.

## Create a `Dockerfile` in your app project

	FROM resin/armel-systemd:latest
	# Enable systemd
	ENV INITSYSTEM on

	CMD bash	

You can then build and run the Docker image:

	docker build -t my-app .
	docker run -it --rm --name my-running-app my-app
