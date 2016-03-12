# What is Raspberrypi3-debian?

The bare bones OS image for Raspberry Pi 3. Apt sources.list from raspbian repository: [http://archive.raspbian.org/raspbian/](http://archive.raspbian.org/raspbian/) added.

# How to use this image

Systemd can be enabled by adding `ENV INITSYSTEM on` to your Dockerfile below the `FROM <Docker image>` line. This will trigger systemd init system on the Docker image.

## Create a `Dockerfile` in your app project

	FROM resin/raspberrypi3-debian:latest
	# Enable systemd
	ENV INITSYSTEM on
	# Your code goes here

You can then build and run the Docker image:

	docker build -t my-app .
	docker run -it --rm --name my-running-app my-app
