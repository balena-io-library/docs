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
	raspberrypi3-debian raspberrypi3-buildpack-deps raspberrypi3-node raspberrypi3-python raspberrypi3-golang

# Jenkins build steps
docker build -t docs-updater .

for REPO in $REPOS
do
	ARGV="resin/$REPO"
	docker run docs-updater -u $USERNAME -p $PASSWORD $ARGV
    
done
