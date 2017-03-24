# What is artik5-alpine-python?

The Python buildpack image for Python apps.

# How to use this image

OpenRC can be enabled by adding `ENV INITSYSTEM on` to your Dockerfile below the `FROM <Docker image>` line. This will trigger OpenRC init system on the Docker image.

## Create a `Dockerfile` in your python app project

	FROM resin/artik5-alpine-python:latest
	# Enable OpenRC
	ENV INITSYSTEM on
	# Your code goes here

You can then build and run the Docker image:

	docker build -t my-app .
	docker run -it --rm --name my-running-app my-app
