# Supported tags and respective `Dockerfile` links

-	[`2.7.11`, `2.7`, `latest` (*python/edison/2.7/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/22e06093d343189f1d7c0b1c6904528638a99640/python/edison/2.7/Dockerfile)
-	[`2.7.11-onbuild`, `2.7-onbuild`, `onbuild` (*python/edison/2.7/onbuild/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/c6ec6680c3d256c02e773bf29e7d907e132c542a/python/edison/2.7/onbuild/Dockerfile)
-	[`2.7.11-slim`, `2.7-slim`, `slim` (*python/edison/2.7/slim/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/22e06093d343189f1d7c0b1c6904528638a99640/python/edison/2.7/slim/Dockerfile)
-	[`2.7.11-wheezy`, `2.7-wheezy`, `wheezy` (*python/edison/2.7/wheezy/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/22e06093d343189f1d7c0b1c6904528638a99640/python/edison/2.7/wheezy/Dockerfile)
-	[`3.2.6`, `3.2` (*python/edison/3.2/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/c6ec6680c3d256c02e773bf29e7d907e132c542a/python/edison/3.2/Dockerfile)
-	[`3.2.6-onbuild`, `3.2-onbuild` (*python/edison/3.2/onbuild/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/a61f20f2fd715789d89f0c262b74cb63934b84c9/python/edison/3.2/onbuild/Dockerfile)
-	[`3.2.6-slim`, `3.2-slim` (*python/edison/3.2/slim/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/c6ec6680c3d256c02e773bf29e7d907e132c542a/python/edison/3.2/slim/Dockerfile)
-	[`3.2.6-wheezy`, `3.2-wheezy` (*python/edison/3.2/wheezy/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/c6ec6680c3d256c02e773bf29e7d907e132c542a/python/edison/3.2/wheezy/Dockerfile)
-	[`3.3.6`, `3.3` (*python/edison/3.3/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/c6ec6680c3d256c02e773bf29e7d907e132c542a/python/edison/3.3/Dockerfile)
-	[`3.3.6-onbuild`, `3.3-onbuild` (*python/edison/3.3/onbuild/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/a61f20f2fd715789d89f0c262b74cb63934b84c9/python/edison/3.3/onbuild/Dockerfile)
-	[`3.3.6-slim`, `3.3-slim` (*python/edison/3.3/slim/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/c6ec6680c3d256c02e773bf29e7d907e132c542a/python/edison/3.3/slim/Dockerfile)
-	[`3.3.6-wheezy`, `3.3-wheezy` (*python/edison/3.3/wheezy/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/c6ec6680c3d256c02e773bf29e7d907e132c542a/python/edison/3.3/wheezy/Dockerfile)
-	[`3.4.4`, `3.4` (*python/edison/3.4/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/c6ec6680c3d256c02e773bf29e7d907e132c542a/python/edison/3.4/Dockerfile)
-	[`3.4.4-onbuild`, `3.4-onbuild` (*python/edison/3.4/onbuild/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/c6ec6680c3d256c02e773bf29e7d907e132c542a/python/edison/3.4/onbuild/Dockerfile)
-	[`3.4.4-slim`, `3.4-slim` (*python/edison/3.4/slim/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/c6ec6680c3d256c02e773bf29e7d907e132c542a/python/edison/3.4/slim/Dockerfile)
-	[`3.4.4-wheezy`, `3.4-wheezy` (*python/edison/3.4/wheezy/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/c6ec6680c3d256c02e773bf29e7d907e132c542a/python/edison/3.4/wheezy/Dockerfile)
-	[`3.5.1`, `3.5` (*python/edison/3.5/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/c6ec6680c3d256c02e773bf29e7d907e132c542a/python/edison/3.5/Dockerfile)
-	[`3.5.1-onbuild`, `3.5-onbuild` (*python/edison/3.5/onbuild/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/c6ec6680c3d256c02e773bf29e7d907e132c542a/python/edison/3.5/onbuild/Dockerfile)
-	[`3.5.1-slim`, `3.5-slim` (*python/edison/3.5/slim/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/c6ec6680c3d256c02e773bf29e7d907e132c542a/python/edison/3.5/slim/Dockerfile)
-	[`3.5.1-wheezy`, `3.5-wheezy` (*python/edison/3.5/wheezy/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/c6ec6680c3d256c02e773bf29e7d907e132c542a/python/edison/3.5/wheezy/Dockerfile)

For more information about this image and its history, please see the [relevant manifest file (`resin/edison-python`)](https://github.com/resin-io-library/official-images/blob/master/library/edison-python) in the [`resin-io-library/official-images` GitHub repo](https://github.com/resin-io-library/official-images).

# What is Edison-python?

The Python buildpack image for Python apps for Intel Edison.

# How to use this image

Systemd can be enabled by adding `ENV INITSYSTEM on` to your Dockerfile below the `FROM <Docker image>` line. This will trigger systemd init system on the Docker image.

## Create a `Dockerfile` in your python app project

	FROM resin/edison-python:latest
	# Enable systemd
	ENV INITSYSTEM on
	# Your code goes here

You can then build and run the Docker image:

	docker build -t my-app .
	docker run -it --rm --name my-running-app my-app

# License

View [license information](https://docs.python.org/2/license.html) for the software contained in this image.

# Supported Docker versions

This image is officially supported on Docker version 1.9.1.

Support for older versions (down to 1.0) is provided on a best-effort basis.

# User Feedback

## Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/resin-io-library/base-images/issues).

## Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/resin-io-library/base-images/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.
