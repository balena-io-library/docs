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
	beaglebone-green-wifi-alpine beaglebone-green-wifi-alpine-buildpack-deps beaglebone-green-wifi-alpine-node beaglebone-green-wifi-alpine-python beaglebone-green-wifi-alpine-golang \
	beaglebone-fedora beaglebone-fedora-buildpack-deps beaglebone-fedora-node beaglebone-fedora-python beaglebone-fedora-golang \
	raspberrypi2-fedora raspberrypi2-fedora-buildpack-deps raspberrypi2-fedora-node raspberrypi2-fedora-python raspberrypi2-fedora-golang \
	nuc-fedora nuc-fedora-buildpack-deps nuc-fedora-node nuc-fedora-python nuc-fedora-golang \
	cubox-i-fedora cubox-i-fedora-buildpack-deps cubox-i-fedora-node cubox-i-fedora-python cubox-i-fedora-golang \
	nitrogen6x-fedora nitrogen6x-fedora-buildpack-deps nitrogen6x-fedora-node nitrogen6x-fedora-python nitrogen6x-fedora-golang \
	odroid-c1-fedora odroid-c1-fedora-buildpack-deps odroid-c1-fedora-node odroid-c1-fedora-python odroid-c1-fedora-golang \
	odroid-ux3-fedora odroid-ux3-fedora-buildpack-deps odroid-ux3-fedora-node odroid-ux3-fedora-python odroid-ux3-fedora-golang \
	parallella-hdmi-resin-fedora parallella-hdmi-resin-fedora-buildpack-deps parallella-hdmi-resin-fedora-node parallella-hdmi-resin-fedora-python parallella-hdmi-resin-fedora-golang \
	ts4900-fedora ts4900-fedora-buildpack-deps ts4900-fedora-node ts4900-fedora-python ts4900-fedora-golang \
	vab820-quad-fedora vab820-quad-fedora-buildpack-deps vab820-quad-fedora-node vab820-quad-fedora-python vab820-quad-fedora-golang \
	zc702-zynq7-fedora zc702-zynq7-fedora-buildpack-deps zc702-zynq7-fedora-node zc702-zynq7-fedora-python zc702-zynq7-fedora-golang \
	raspberrypi3-fedora raspberrypi3-fedora-buildpack-deps raspberrypi3-fedora-node raspberrypi3-fedora-python raspberrypi3-fedora-golang \
	apalis-imx6-fedora apalis-imx6-fedora-buildpack-deps apalis-imx6-fedora-node apalis-imx6-fedora-python apalis-imx6-fedora-golang \
	artik10-fedora artik10-fedora-buildpack-deps artik10-fedora-node artik10-fedora-python artik10-fedora-golang \
	artik5-fedora artik5-fedora-buildpack-deps artik5-fedora-node artik5-fedora-python artik5-fedora-golang \
	colibri-imx6-fedora colibri-imx6-fedora-buildpack-deps colibri-imx6-fedora-node colibri-imx6-fedora-python colibri-imx6-fedora-golang \
	beaglebone-green-wifi-fedora beaglebone-green-wifi-fedora-buildpack-deps beaglebone-green-wifi-fedora-node beaglebone-green-wifi-fedora-python beaglebone-green-wifi-fedora-golang \
	qemux86-64-debian qemux86-64-buildpack-deps qemux86-64-node qemux86-64-python qemux86-64-golang \
	qemux86-64-alpine qemux86-64-alpine-buildpack-deps qemux86-64-alpine-node qemux86-64-alpine-python qemux86-64-alpine-golang \
	qemux86-debian qemux86-buildpack-deps qemux86-node qemux86-python qemux86-golang \
	qemux86-alpine qemux86-alpine-buildpack-deps qemux86-alpine-node qemux86-alpine-python qemux86-alpine-golang \
	qemux86-fedora qemux86-fedora-buildpack-deps qemux86-fedora-node qemux86-fedora-python qemux86-fedora-golang \
	artik710-debian artik710-buildpack-deps artik710-node artik710-python artik710-golang \
	artik710-alpine artik710-alpine-buildpack-deps artik710-alpine-node artik710-alpine-python artik710-alpine-golang \
	artik710-fedora artik710-fedora-buildpack-deps artik710-fedora-node artik710-fedora-python artik710-fedora-golang \
	intel-quark-debian intel-quark-buildpack-deps intel-quark-node intel-quark-python intel-quark-golang \
	intel-quark-alpine intel-quark-alpine-buildpack-deps intel-quark-alpine-node intel-quark-alpine-python intel-quark-alpine-golang \
	raspberrypi-openjdk raspberrypi-alpine-openjdk \
	raspberrypi2-openjdk raspberrypi2-alpine-openjdk raspberrypi2-fedora-openjdk \
	beaglebone-openjdk beaglebone-alpine-openjdk beaglebone-fedora-openjdk \
	edison-openjdk edison-alpine-openjdk \
	nuc-openjdk nuc-alpine-openjdk nuc-fedora-openjdk \
	vab820-quad-openjdk vab820-quad-alpine-openjdk vab820-quad-fedora-openjdk \
	zc702-zynq7-openjdk zc702-zynq7-alpine-openjdk zc702-zynq7-fedora-openjdk \
	odroid-c1-openjdk odroid-c1-alpine-openjdk odroid-c1-fedora-openjdk \
	odroid-ux3-openjdk odroid-ux3-alpine-openjdk odroid-ux3-fedora-openjdk \
	parallella-hdmi-resin-openjdk parallella-hdmi-resin-alpine-openjdk parallella-hdmi-resin-fedora-openjdk \
	nitrogen6x-openjdk nitrogen6x-alpine-openjdk nitrogen6x-fedora-openjdk \
	cubox-i-openjdk cubox-i-alpine-openjdk cubox-i-fedora-openjdk \
	ts4900-openjdk ts4900-alpine-openjdk ts4900-fedora-openjdk \
	colibri-imx6-openjdk colibri-imx6-alpine-openjdk colibri-imx6-fedora-openjdk \
	apalis-imx6-openjdk apalis-imx6-alpine-openjdk apalis-imx6-fedora-openjdk \
	ts7700-openjdk ts7700-alpine-openjdk \
	raspberrypi3-openjdk raspberrypi3-alpine-openjdk raspberrypi3-fedora-openjdk \
	artik5-openjdk artik5-alpine-openjdk artik5-fedora-openjdk \
	artik10-openjdk artik10-alpine-openjdk artik10-fedora-openjdk \
	beaglebone-green-wifi-openjdk beaglebone-green-wifi-alpine-openjdk beaglebone-green-wifi-fedora-openjdk \
	qemux86-openjdk qemux86-alpine-openjdk \
	qemux86-64-openjdk qemux86-64-alpine-openjdk qemux86-64-fedora-openjdk \
	artik710-openjdk artik710-alpine-openjdk artik710-fedora-openjdk \
	intel-quark-openjdk intel-quark-alpine-openjdk

# Jenkins build steps
docker build -t docs-updater .

for REPO in $REPOS
do
	ARGV="resin/$REPO"
	docker run docs-updater -u $USERNAME -p $PASSWORD $ARGV
    
done
