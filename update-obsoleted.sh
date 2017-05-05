#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

repos='rpi-nodejs rpi-node armv7hf-node rpi-buildpack-deps armv7hf-buildpack-deps i386-node i386-buildpack-deps armel-node amd64-node \
	armv7hf-systemd raspberrypi-systemd i386-systemd amd64-systemd armel-systemd \
	raspberrypi-debian raspberrypi-buildpack-deps raspberrypi-golang raspberrypi-node raspberrypi-python raspberrypi-openjdk \
	raspberrypi-alpine raspberrypi-alpine-buildpack-deps raspberrypi-alpine-golang raspberrypi-alpine-node raspberrypi-alpine-python raspberrypi-alpine-openjdk \
	raspberrypi2-debian raspberrypi2-buildpack-deps raspberrypi2-golang raspberrypi2-node raspberrypi2-python raspberrypi2-openjdk \
	raspberrypi2-alpine raspberrypi2-alpine-buildpack-deps raspberrypi2-alpine-golang raspberrypi2-alpine-node raspberrypi2-alpine-python raspberrypi2-alpine-openjdk \
	raspberrypi2-fedora raspberrypi2-fedora-buildpack-deps raspberrypi2-fedora-golang raspberrypi2-fedora-node raspberrypi2-fedora-python raspberrypi2-fedora-openjdk \
	raspberry-pi3-debian raspberry-pi3-buildpack-deps raspberry-pi3-golang raspberry-pi3-node raspberry-pi3-python raspberry-pi3-openjdk \
	raspberry-pi3-alpine raspberry-pi3-alpine-buildpack-deps raspberry-pi3-alpine-golang raspberry-pi3-alpine-node raspberry-pi3-alpine-python raspberry-pi3-alpine-openjdk \
	raspberry-pi3-fedora raspberry-pi3-fedora-buildpack-deps raspberry-pi3-fedora-golang raspberry-pi3-fedora-node raspberry-pi3-fedora-python raspberry-pi3-fedora-openjdk \
	beaglebone-debian beaglebone-buildpack-deps beaglebone-golang beaglebone-node beaglebone-python beaglebone-openjdk \
	beaglebone-alpine beaglebone-alpine-buildpack-deps beaglebone-alpine-golang beaglebone-alpine-node beaglebone-alpine-python beaglebone-alpine-openjdk \
	beaglebone-fedora beaglebone-fedora-buildpack-deps beaglebone-fedora-golang beaglebone-fedora-node beaglebone-fedora-python beaglebone-fedora-openjdk \
	edison-debian edison-buildpack-deps edison-golang edison-node edison-python edison-openjdk \
	edison-alpine edison-alpine-buildpack-deps edison-alpine-golang edison-alpine-node edison-alpine-python edison-alpine-openjdk \
	nuc-debian nuc-buildpack-deps nuc-golang nuc-node nuc-python nuc-openjdk \
	nuc-alpine nuc-alpine-buildpack-deps nuc-alpine-golang nuc-alpine-node nuc-alpine-python nuc-alpine-openjdk \
	nuc-fedora nuc-fedora-buildpack-deps nuc-fedora-golang nuc-fedora-node nuc-fedora-python nuc-fedora-openjdk \
	upboard-debian upboard-buildpack-deps upboard-golang upboard-node upboard-python upboard-openjdk \
	upboard-alpine upboard-alpine-buildpack-deps upboard-alpine-golang upboard-alpine-node upboard-alpine-python upboard-alpine-openjdk \
	upboard-fedora upboard-fedora-buildpack-deps upboard-fedora-golang upboard-fedora-node upboard-fedora-python upboard-fedora-openjdk \
	am57xx-evm-debian am57xx-evm-buildpack-deps am57xx-evm-golang am57xx-evm-node am57xx-evm-python am57xx-evm-openjdk \
	am57xx-evm-alpine am57xx-evm-alpine-buildpack-deps am57xx-evm-alpine-golang am57xx-evm-alpine-node am57xx-evm-alpine-python am57xx-evm-alpine-openjdk \
	am57xx-evm-fedora am57xx-evm-fedora-buildpack-deps am57xx-evm-fedora-golang am57xx-evm-fedora-node am57xx-evm-fedora-python am57xx-evm-fedora-openjdk \
	intel-quark-debian intel-quark-buildpack-deps intel-quark-golang intel-quark-node intel-quark-python intel-quark-openjdk \
	intel-quark-alpine intel-quark-alpine-buildpack-deps intel-quark-alpine-golang intel-quark-alpine-node intel-quark-alpine-python intel-quark-alpine-openjdk \
	apalis-imx6-debian apalis-imx6-buildpack-deps apalis-imx6-golang apalis-imx6-node apalis-imx6-python apalis-imx6-openjdk \
	apalis-imx6-alpine apalis-imx6-alpine-buildpack-deps apalis-imx6-alpine-golang apalis-imx6-alpine-node apalis-imx6-alpine-python apalis-imx6-alpine-openjdk \
	apalis-imx6-fedora apalis-imx6-fedora-buildpack-deps apalis-imx6-fedora-golang apalis-imx6-fedora-node apalis-imx6-fedora-python apalis-imx6-fedora-openjdk \
	colibri-imx6-debian colibri-imx6-buildpack-deps colibri-imx6-golang colibri-imx6-node colibri-imx6-python colibri-imx6-openjdk \
	colibri-imx6-alpine colibri-imx6-alpine-buildpack-deps colibri-imx6-alpine-golang colibri-imx6-alpine-node colibri-imx6-alpine-python colibri-imx6-alpine-openjdk \
	colibri-imx6-fedora colibri-imx6-fedora-buildpack-deps colibri-imx6-fedora-golang colibri-imx6-fedora-node colibri-imx6-fedora-python colibri-imx6-fedora-openjdk \
	odroid-ux3-debian odroid-ux3-buildpack-deps odroid-ux3-golang odroid-ux3-node odroid-ux3-python odroid-ux3-openjdk \
	odroid-ux3-alpine odroid-ux3-alpine-buildpack-deps odroid-ux3-alpine-golang odroid-ux3-alpine-node odroid-ux3-alpine-python odroid-ux3-alpine-openjdk \
	odroid-ux3-fedora odroid-ux3-fedora-buildpack-deps odroid-ux3-fedora-golang odroid-ux3-fedora-node odroid-ux3-fedora-python odroid-ux3-fedora-openjdk \
	parallella-hdmi-resin-debian parallella-hdmi-resin-buildpack-deps parallella-hdmi-resin-golang parallella-hdmi-resin-node parallella-hdmi-resin-python parallella-hdmi-resin-openjdk \
	parallella-hdmi-resin-alpine parallella-hdmi-resin-alpine-buildpack-deps parallella-hdmi-resin-alpine-golang parallella-hdmi-resin-alpine-node parallella-hdmi-resin-alpine-python parallella-hdmi-resin-alpine-openjdk \
	parallella-hdmi-resin-fedora parallella-hdmi-resin-fedora-buildpack-deps parallella-hdmi-resin-fedora-golang parallella-hdmi-resin-fedora-node parallella-hdmi-resin-fedora-python parallella-hdmi-resin-fedora-openjdk \
	cubox-i-debian cubox-i-buildpack-deps cubox-i-golang cubox-i-node cubox-i-python cubox-i-openjdk \
	cubox-i-alpine cubox-i-alpine-buildpack-deps cubox-i-alpine-golang cubox-i-alpine-node cubox-i-alpine-python cubox-i-alpine-openjdk \
	cubox-i-fedora cubox-i-fedora-buildpack-deps cubox-i-fedora-golang cubox-i-fedora-node cubox-i-fedora-python cubox-i-fedora-openjdk \
	zc702-zynq7-debian zc702-zynq7-buildpack-deps zc702-zynq7-golang zc702-zynq7-node zc702-zynq7-python zc702-zynq7-openjdk \
	zc702-zynq7-alpine zc702-zynq7-alpine-buildpack-deps zc702-zynq7-alpine-golang zc702-zynq7-alpine-node zc702-zynq7-alpine-python zc702-zynq7-alpine-openjdk \
	zc702-zynq7-fedora zc702-zynq7-fedora-buildpack-deps zc702-zynq7-fedora-golang zc702-zynq7-fedora-node zc702-zynq7-fedora-python zc702-zynq7-fedora-openjdk \
	vab820-quad-debian vab820-quad-buildpack-deps vab820-quad-golang vab820-quad-node vab820-quad-python vab820-quad-openjdk \
	vab820-quad-alpine vab820-quad-alpine-buildpack-deps vab820-quad-alpine-golang vab820-quad-alpine-node vab820-quad-alpine-python vab820-quad-alpine-openjdk'

for repo in $repos; do
	# Clean up old directory
	rm -rf $repo
	# Generate new dir
	mkdir $repo
	cat <<-EOF > $repo/README.md
		This repository is obsolete. Please check http://docs.resin.io/#/pages/runtime/resin-base-images.md for information about resin docker images.
	EOF

	cat <<-EOF > $repo/README-short.txt
		This repository is obsolete.
	EOF

done
