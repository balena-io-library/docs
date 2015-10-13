# Supported tags and respective `Dockerfile` links

-	[`jessie`, `latest` (*device-base/raspberrypi2/jessie/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/92f4aec4fbd7ee5617aab10d597abc21a1009ea2/device-base/raspberrypi2/jessie/Dockerfile)
-	[`wheezy` (*device-base/raspberrypi2/wheezy/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/92f4aec4fbd7ee5617aab10d597abc21a1009ea2/device-base/raspberrypi2/wheezy/Dockerfile)

For more information about this image and its history, please see the [relevant manifest file (`resin/raspberrypi2-debian`)](https://github.com/resin-io-library/official-images/blob/master/library/raspberrypi2-debian) in the [`resin-io-library/official-images` GitHub repo](https://github.com/resin-io-library/official-images).

# What is Raspberrypi2-debian?

The bare bones OS image for Raspberry Pi 2. Apt sources.list from raspbian repository: [http://archive.raspbian.org/raspbian/](http://archive.raspbian.org/raspbian/) added.

# How to use this image

Systemd can be enabled by adding `ENV INITSYSTEM on` to your Dockerfile below the `FROM <Docker image>` line. This will trigger systemd init system on the Docker image.

## Create a `Dockerfile` in your app project

	FROM resin/raspberrypi2-debian:latest
	# Enable systemd
	ENV INITSYSTEM on
	# Your code goes here

You can then build and run the Docker image:

	docker build -t my-app .
	docker run -it --rm --name my-running-app my-app

# License

View [license information](https://www.debian.org/social_contract#guidelines) for the software contained in this image.

# Supported Docker versions

This image is officially supported on Docker version 1.8.3.

Support for older versions (down to 1.0) is provided on a best-effort basis.

# User Feedback

## Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/resin-io-library/base-images/issues).

## Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/resin-io-library/base-images/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.
