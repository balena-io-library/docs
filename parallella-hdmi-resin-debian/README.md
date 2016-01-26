# Supported tags and respective `Dockerfile` links

-	[`jessie`, `latest` (*device-base/parallella-hdmi-resin/jessie/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/264e3a976f6f9b2b0209515989445e47b48275a1/device-base/parallella-hdmi-resin/jessie/Dockerfile)
-	[`wheezy` (*device-base/parallella-hdmi-resin/wheezy/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/264e3a976f6f9b2b0209515989445e47b48275a1/device-base/parallella-hdmi-resin/wheezy/Dockerfile)

For more information about this image and its history, please see the [relevant manifest file (`resin/parallella-hdmi-resin-debian`)](https://github.com/resin-io-library/official-images/blob/master/library/parallella-hdmi-resin-debian) in the [`resin-io-library/official-images` GitHub repo](https://github.com/resin-io-library/official-images).

# What is parallella-hdmi-resin-debian?

The bare bones OS image for Parallella.

# How to use this image

Systemd can be enabled by adding `ENV INITSYSTEM on` to your Dockerfile below the `FROM <Docker image>` line. This will trigger systemd init system on the Docker image.

## Create a `Dockerfile` in your app project

	FROM resin/parallella-hdmi-resin-debian:latest
	# Enable systemd
	ENV INITSYSTEM on
	# Your code goes here

You can then build and run the Docker image:

	docker build -t my-app .
	docker run -it --rm --name my-running-app my-app

# License

View [license information](https://www.debian.org/social_contract#guidelines) for the software contained in this image.

# Supported Docker versions

This image is officially supported on Docker version 1.9.1.

Support for older versions (down to 1.0) is provided on a best-effort basis.

# User Feedback

## Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/resin-io-library/base-images/issues).

## Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/resin-io-library/base-images/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.
