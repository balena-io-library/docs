#!/bin/bash

set -o errexit

# Update docs
bash update-obsoleted.sh
bash update.sh armv7hf-systemd raspberrypi-systemd i386-systemd amd64-systemd armel-systemd \
	beaglebone-debian beaglebone-buildpack-deps beaglebone-node beaglebone-python beaglebone-golang \
	raspberrypi2-debian raspberrypi2-buildpack-deps raspberrypi2-node raspberrypi2-python raspberrypi2-golang \
	raspberrypi-buildpack-deps raspberrypi-node raspberrypi-python raspberrypi-golang \
	edison-debian edison-buildpack-deps edison-node edison-python edison-golang \
	nuc-debian nuc-buildpack-deps nuc-node nuc-python nuc-golang \
	cubox-i-debian cubox-i-buildpack-deps cubox-i-node cubox-i-python cubox-i-golang \
	nitrogen6x-debian nitrogen6x-buildpack-deps nitrogen6x-node nitrogen6x-python nitrogen6x-golang \
	odroid-c1-debian odroid-c1-buildpack-deps odroid-c1-node odroid-c1-python odroid-c1-golang \
	odroid-ux3-debian odroid-ux3-buildpack-deps odroid-ux3-node odroid-ux3-python odroid-ux3-golang \
	parallella-hdmi-resin-debian parallella-hdmi-resin-buildpack-deps parallella-hdmi-resin-node parallella-hdmi-resin-python parallella-hdmi-resin-golang \
	ts4900-debian ts4900-buildpack-deps ts4900-node ts4900-python ts4900-golang \
	vab820-quad-debian vab820-quad-buildpack-deps vab820-quad-node vab820-quad-python vab820-quad-golang \
	zc702-zynq7-debian zc702-zynq7-buildpack-deps zc702-zynq7-node zc702-zynq7-python zc702-zynq7-golang \
	ts7700-debian ts7700-buildpack-deps ts7700-node ts7700-python ts7700-golang \
	raspberrypi3-debian raspberrypi3-buildpack-deps raspberrypi3-node raspberrypi3-python raspberrypi3-golang \
	apalis-imx6-debian apalis-imx6-buildpack-deps apalis-imx6-node apalis-imx6-python apalis-imx6-golang \
	artik10-debian artik10-buildpack-deps artik10-node artik10-python artik10-golang \
	artik5-debian artik5-buildpack-deps artik5-node artik5-python artik5-golang \
	colibri-imx6-debian colibri-imx6-buildpack-deps colibri-imx6-node colibri-imx6-python colibri-imx6-golang \
	beaglebone-green-wifi-debian beaglebone-green-wifi-buildpack-deps beaglebone-green-wifi-node beaglebone-green-wifi-python beaglebone-green-wifi-golang \
	beaglebone-alpine beaglebone-alpine-buildpack-deps beaglebone-alpine-node beaglebone-alpine-python beaglebone-alpine-golang \
	raspberrypi2-alpine raspberrypi2-alpine-buildpack-deps raspberrypi2-alpine-node raspberrypi2-alpine-python raspberrypi2-alpine-golang \
	raspberrypi-alpine raspberrypi-alpine-buildpack-deps raspberrypi-alpine-node raspberrypi-alpine-python raspberrypi-alpine-golang \
	edison-alpine edison-alpine-buildpack-deps edison-alpine-node edison-alpine-python edison-alpine-golang \
	nuc-alpine nuc-alpine-buildpack-deps nuc-alpine-node nuc-alpine-python nuc-alpine-golang \
	cubox-i-alpine cubox-i-alpine-buildpack-deps cubox-i-alpine-node cubox-i-alpine-python cubox-i-alpine-golang \
	nitrogen6x-alpine nitrogen6x-alpine-buildpack-deps nitrogen6x-alpine-node nitrogen6x-alpine-python nitrogen6x-alpine-golang \
	odroid-c1-alpine odroid-c1-alpine-buildpack-deps odroid-c1-alpine-node odroid-c1-alpine-python odroid-c1-alpine-golang \
	odroid-ux3-alpine odroid-ux3-alpine-buildpack-deps odroid-ux3-alpine-node odroid-ux3-alpine-python odroid-ux3-alpine-golang \
	parallella-hdmi-resin-alpine parallella-hdmi-resin-alpine-buildpack-deps parallella-hdmi-resin-alpine-node parallella-hdmi-resin-alpine-python parallella-hdmi-resin-alpine-golang \
	ts4900-alpine ts4900-alpine-buildpack-deps ts4900-alpine-node ts4900-alpine-python ts4900-alpine-golang \
	vab820-quad-alpine vab820-quad-alpine-buildpack-deps vab820-quad-alpine-node vab820-quad-alpine-python vab820-quad-alpine-golang \
	zc702-zynq7-alpine zc702-zynq7-alpine-buildpack-deps zc702-zynq7-alpine-node zc702-zynq7-alpine-python zc702-zynq7-alpine-golang \
	ts7700-alpine ts7700-alpine-buildpack-deps ts7700-alpine-node ts7700-alpine-python ts7700-alpine-golang \
	raspberrypi3-alpine raspberrypi3-alpine-buildpack-deps raspberrypi3-alpine-node raspberrypi3-alpine-python raspberrypi3-alpine-golang \
	apalis-imx6-alpine apalis-imx6-alpine-buildpack-deps apalis-imx6-alpine-node apalis-imx6-alpine-python apalis-imx6-alpine-golang \
	artik10-alpine artik10-alpine-buildpack-deps artik10-alpine-node artik10-alpine-python artik10-alpine-golang \
	artik5-alpine artik5-alpine-buildpack-deps artik5-alpine-node artik5-alpine-python artik5-alpine-golang \
	colibri-imx6-alpine colibri-imx6-alpine-buildpack-deps colibri-imx6-alpine-node colibri-imx6-alpine-python colibri-imx6-alpine-golang \
	beaglebone-green-wifi-alpine beaglebone-green-wifi-alpine-buildpack-deps beaglebone-green-wifi-alpine-node beaglebone-green-wifi-alpine-python beaglebone-green-wifi-alpine-golang

# Jenkins build steps
docker build -t docs-updater .

for REPO in $REPOS
do
	ARGV="resin/$REPO"
	docker run docs-updater -u $USERNAME -p $PASSWORD $ARGV
    
done
