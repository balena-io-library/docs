# What is Beaglebone-green-wifi-debian?

The bare bones OS image for Beaglebone Green. With apt sources.list from repositories: [http://repos.rcn-ee.net/debian/](http://repos.rcn-ee.net/debian/) and [http://debian.beagleboard.org](http://debian.beagleboard.org/) added.

# How to use this image

Systemd can be enabled by adding `ENV INITSYSTEM on` to your Dockerfile below the `FROM <Docker image>` line. This will trigger systemd init system on the Docker image.

## Create a `Dockerfile` in your app project

	FROM resin/beaglebone-green-wifi-debian:latest
	# Enable systemd
	ENV INITSYSTEM on
	# Your code goes here

You can then build and run the Docker image:

	docker build -t my-app .
	docker run -it --rm --name my-running-app my-app
