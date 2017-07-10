#!/bin/bash

set -o errexit

# Update docs
bash update-obsoleted.sh
bash update.sh armel-debian rpi-raspbian armv7hf-debian i386-debian amd64-debian aarch64-debian armhf-alpine i386-alpine amd64-alpine aarch64-alpine armv7hf-fedora amd64-fedora aarch64-fedora \
	raspberry-pi-debian raspberry-pi-buildpack-deps raspberry-pi-golang raspberry-pi-node raspberry-pi-python raspberry-pi-openjdk \
	raspberry-pi-alpine raspberry-pi-alpine-buildpack-deps raspberry-pi-alpine-golang raspberry-pi-alpine-node raspberry-pi-alpine-python raspberry-pi-alpine-openjdk \
	raspberry-pi2-debian raspberry-pi2-buildpack-deps raspberry-pi2-golang raspberry-pi2-node raspberry-pi2-python raspberry-pi2-openjdk \
	raspberry-pi2-alpine raspberry-pi2-alpine-buildpack-deps raspberry-pi2-alpine-golang raspberry-pi2-alpine-node raspberry-pi2-alpine-python raspberry-pi2-alpine-openjdk \
	raspberry-pi2-fedora raspberry-pi2-fedora-buildpack-deps raspberry-pi2-fedora-golang raspberry-pi2-fedora-node raspberry-pi2-fedora-python raspberry-pi2-fedora-openjdk \
	beaglebone-black-debian beaglebone-black-buildpack-deps beaglebone-black-golang beaglebone-black-node beaglebone-black-python beaglebone-black-openjdk \
	beaglebone-black-alpine beaglebone-black-alpine-buildpack-deps beaglebone-black-alpine-golang beaglebone-black-alpine-node beaglebone-black-alpine-python beaglebone-black-alpine-openjdk \
	beaglebone-black-fedora beaglebone-black-fedora-buildpack-deps beaglebone-black-fedora-golang beaglebone-black-fedora-node beaglebone-black-fedora-python beaglebone-black-fedora-openjdk \
	intel-edison-debian intel-edison-buildpack-deps intel-edison-golang intel-edison-node intel-edison-python intel-edison-openjdk \
	intel-edison-alpine intel-edison-alpine-buildpack-deps intel-edison-alpine-golang intel-edison-alpine-node intel-edison-alpine-python intel-edison-alpine-openjdk \
	intel-nuc-debian intel-nuc-buildpack-deps intel-nuc-golang intel-nuc-node intel-nuc-python intel-nuc-openjdk \
	intel-nuc-alpine intel-nuc-alpine-buildpack-deps intel-nuc-alpine-golang intel-nuc-alpine-node intel-nuc-alpine-python intel-nuc-alpine-openjdk \
	intel-nuc-fedora intel-nuc-fedora-buildpack-deps intel-nuc-fedora-golang intel-nuc-fedora-node intel-nuc-fedora-python intel-nuc-fedora-openjdk \
	via-vab820-quad-debian via-vab820-quad-buildpack-deps via-vab820-quad-golang via-vab820-quad-node via-vab820-quad-python via-vab820-quad-openjdk \
	via-vab820-quad-alpine via-vab820-quad-alpine-buildpack-deps via-vab820-quad-alpine-golang via-vab820-quad-alpine-node via-vab820-quad-alpine-python via-vab820-quad-alpine-openjdk \
	via-vab820-quad-fedora via-vab820-quad-fedora-buildpack-deps via-vab820-quad-fedora-golang via-vab820-quad-fedora-node via-vab820-quad-fedora-python via-vab820-quad-fedora-openjdk \
	zynq-xz702-debian zynq-xz702-buildpack-deps zynq-xz702-golang zynq-xz702-node zynq-xz702-python zynq-xz702-openjdk \
	zynq-xz702-alpine zynq-xz702-alpine-buildpack-deps zynq-xz702-alpine-golang zynq-xz702-alpine-node zynq-xz702-alpine-python zynq-xz702-alpine-openjdk \
	zynq-xz702-fedora zynq-xz702-fedora-buildpack-deps zynq-xz702-fedora-golang zynq-xz702-fedora-node zynq-xz702-fedora-python zynq-xz702-fedora-openjdk \
	odroid-c1-debian odroid-c1-buildpack-deps odroid-c1-golang odroid-c1-node odroid-c1-python odroid-c1-openjdk \
	odroid-c1-alpine odroid-c1-alpine-buildpack-deps odroid-c1-alpine-golang odroid-c1-alpine-node odroid-c1-alpine-python odroid-c1-alpine-openjdk \
	odroid-c1-fedora odroid-c1-fedora-buildpack-deps odroid-c1-fedora-golang odroid-c1-fedora-node odroid-c1-fedora-python odroid-c1-fedora-openjdk \
	odroid-xu4-debian odroid-xu4-buildpack-deps odroid-xu4-golang odroid-xu4-node odroid-xu4-python odroid-xu4-openjdk \
	odroid-xu4-alpine odroid-xu4-alpine-buildpack-deps odroid-xu4-alpine-golang odroid-xu4-alpine-node odroid-xu4-alpine-python odroid-xu4-alpine-openjdk \
	odroid-xu4-fedora odroid-xu4-fedora-buildpack-deps odroid-xu4-fedora-golang odroid-xu4-fedora-node odroid-xu4-fedora-python odroid-xu4-fedora-openjdk \
	parallella-debian parallella-buildpack-deps parallella-golang parallella-node parallella-python parallella-openjdk \
	parallella-alpine parallella-alpine-buildpack-deps parallella-alpine-golang parallella-alpine-node parallella-alpine-python parallella-alpine-openjdk \
	parallella-fedora parallella-fedora-buildpack-deps parallella-fedora-golang parallella-fedora-node parallella-fedora-python parallella-fedora-openjdk \
	nitrogen6x-debian nitrogen6x-buildpack-deps nitrogen6x-golang nitrogen6x-node nitrogen6x-python nitrogen6x-openjdk \
	nitrogen6x-alpine nitrogen6x-alpine-buildpack-deps nitrogen6x-alpine-golang nitrogen6x-alpine-node nitrogen6x-alpine-python nitrogen6x-alpine-openjdk \
	nitrogen6x-fedora nitrogen6x-fedora-buildpack-deps nitrogen6x-fedora-golang nitrogen6x-fedora-node nitrogen6x-fedora-python nitrogen6x-fedora-openjdk \
	hummingboard-debian hummingboard-buildpack-deps hummingboard-golang hummingboard-node hummingboard-python hummingboard-openjdk \
	hummingboard-alpine hummingboard-alpine-buildpack-deps hummingboard-alpine-golang hummingboard-alpine-node hummingboard-alpine-python hummingboard-alpine-openjdk \
	hummingboard-fedora hummingboard-fedora-buildpack-deps hummingboard-fedora-golang hummingboard-fedora-node hummingboard-fedora-python hummingboard-fedora-openjdk \
	ts4900-debian ts4900-buildpack-deps ts4900-golang ts4900-node ts4900-python ts4900-openjdk \
	ts4900-alpine ts4900-alpine-buildpack-deps ts4900-alpine-golang ts4900-alpine-node ts4900-alpine-python ts4900-alpine-openjdk \
	ts4900-fedora ts4900-fedora-buildpack-deps ts4900-fedora-golang ts4900-fedora-node ts4900-fedora-python ts4900-fedora-openjdk \
	colibri-imx6dl-debian colibri-imx6dl-buildpack-deps colibri-imx6dl-golang colibri-imx6dl-node colibri-imx6dl-python colibri-imx6dl-openjdk \
	colibri-imx6dl-alpine colibri-imx6dl-alpine-buildpack-deps colibri-imx6dl-alpine-golang colibri-imx6dl-alpine-node colibri-imx6dl-alpine-python colibri-imx6dl-alpine-openjdk \
	colibri-imx6dl-fedora colibri-imx6dl-fedora-buildpack-deps colibri-imx6dl-fedora-golang colibri-imx6dl-fedora-node colibri-imx6dl-fedora-python colibri-imx6dl-fedora-openjdk \
	apalis-imx6q-debian apalis-imx6q-buildpack-deps apalis-imx6q-golang apalis-imx6q-node apalis-imx6q-python apalis-imx6q-openjdk \
	apalis-imx6q-alpine apalis-imx6q-alpine-buildpack-deps apalis-imx6q-alpine-golang apalis-imx6q-alpine-node apalis-imx6q-alpine-python apalis-imx6q-alpine-openjdk \
	apalis-imx6q-fedora apalis-imx6q-fedora-buildpack-deps apalis-imx6q-fedora-golang apalis-imx6q-fedora-node apalis-imx6q-fedora-python apalis-imx6q-fedora-openjdk \
	ts7700-debian ts7700-buildpack-deps ts7700-golang ts7700-node ts7700-python ts7700-openjdk \
	ts7700-alpine ts7700-alpine-buildpack-deps ts7700-alpine-golang ts7700-alpine-node ts7700-alpine-python ts7700-alpine-openjdk \
	raspberrypi3-debian raspberrypi3-buildpack-deps raspberrypi3-golang raspberrypi3-node raspberrypi3-python raspberrypi3-openjdk \
	raspberrypi3-alpine raspberrypi3-alpine-buildpack-deps raspberrypi3-alpine-golang raspberrypi3-alpine-node raspberrypi3-alpine-python raspberrypi3-alpine-openjdk \
	raspberrypi3-fedora raspberrypi3-fedora-buildpack-deps raspberrypi3-fedora-golang raspberrypi3-fedora-node raspberrypi3-fedora-python raspberrypi3-fedora-openjdk \
	artik5-debian artik5-buildpack-deps artik5-golang artik5-node artik5-python artik5-openjdk \
	artik5-alpine artik5-alpine-buildpack-deps artik5-alpine-golang artik5-alpine-node artik5-alpine-python artik5-alpine-openjdk \
	artik5-fedora artik5-fedora-buildpack-deps artik5-fedora-golang artik5-fedora-node artik5-fedora-python artik5-fedora-openjdk \
	artik10-debian artik10-buildpack-deps artik10-golang artik10-node artik10-python artik10-openjdk \
	artik10-alpine artik10-alpine-buildpack-deps artik10-alpine-golang artik10-alpine-node artik10-alpine-python artik10-alpine-openjdk \
	artik10-fedora artik10-fedora-buildpack-deps artik10-fedora-golang artik10-fedora-node artik10-fedora-python artik10-fedora-openjdk \
	beaglebone-green-wifi-debian beaglebone-green-wifi-buildpack-deps beaglebone-green-wifi-golang beaglebone-green-wifi-node beaglebone-green-wifi-python beaglebone-green-wifi-openjdk \
	beaglebone-green-wifi-alpine beaglebone-green-wifi-alpine-buildpack-deps beaglebone-green-wifi-alpine-golang beaglebone-green-wifi-alpine-node beaglebone-green-wifi-alpine-python beaglebone-green-wifi-alpine-openjdk \
	beaglebone-green-wifi-fedora beaglebone-green-wifi-fedora-buildpack-deps beaglebone-green-wifi-fedora-golang beaglebone-green-wifi-fedora-node beaglebone-green-wifi-fedora-python beaglebone-green-wifi-fedora-openjdk \
	qemux86-debian qemux86-buildpack-deps qemux86-golang qemux86-node qemux86-python qemux86-openjdk \
	qemux86-alpine qemux86-alpine-buildpack-deps qemux86-alpine-golang qemux86-alpine-node qemux86-alpine-python qemux86-alpine-openjdk \
	qemux86-64-debian qemux86-64-buildpack-deps qemux86-64-golang qemux86-64-node qemux86-64-python qemux86-64-openjdk \
	qemux86-64-alpine qemux86-64-alpine-buildpack-deps qemux86-64-alpine-golang qemux86-64-alpine-node qemux86-64-alpine-python qemux86-64-alpine-openjdk \
	qemux86-64-fedora qemux86-64-fedora-buildpack-deps qemux86-64-fedora-golang qemux86-64-fedora-node qemux86-64-fedora-python qemux86-64-fedora-openjdk \
	beaglebone-green-debian beaglebone-green-buildpack-deps beaglebone-green-golang beaglebone-green-node beaglebone-green-python beaglebone-green-openjdk \
	beaglebone-green-alpine beaglebone-green-alpine-buildpack-deps beaglebone-green-alpine-golang beaglebone-green-alpine-node beaglebone-green-alpine-python beaglebone-green-alpine-openjdk \
	beaglebone-green-fedora beaglebone-green-fedora-buildpack-deps beaglebone-green-fedora-golang beaglebone-green-fedora-node beaglebone-green-fedora-python beaglebone-green-fedora-openjdk \
	cybertan-ze250-debian cybertan-ze250-buildpack-deps cybertan-ze250-golang cybertan-ze250-node cybertan-ze250-python cybertan-ze250-openjdk \
	cybertan-ze250-alpine cybertan-ze250-alpine-buildpack-deps cybertan-ze250-alpine-golang cybertan-ze250-alpine-node cybertan-ze250-alpine-python cybertan-ze250-alpine-openjdk \
	artik710-debian artik710-buildpack-deps artik710-golang artik710-node artik710-python artik710-openjdk \
	artik710-alpine artik710-alpine-buildpack-deps artik710-alpine-golang artik710-alpine-node artik710-alpine-python artik710-alpine-openjdk \
	artik710-fedora artik710-fedora-buildpack-deps artik710-fedora-golang artik710-fedora-node artik710-fedora-python artik710-fedora-openjdk \
	am571x-evm-debian am571x-evm-buildpack-deps am571x-evm-golang am571x-evm-node am571x-evm-python am571x-evm-openjdk \
	am571x-evm-alpine am571x-evm-alpine-buildpack-deps am571x-evm-alpine-golang am571x-evm-alpine-node am571x-evm-alpine-python am571x-evm-alpine-openjdk \
	am571x-evm-fedora am571x-evm-fedora-buildpack-deps am571x-evm-fedora-golang am571x-evm-fedora-node am571x-evm-fedora-python am571x-evm-fedora-openjdk \
	upboard-debian upboard-buildpack-deps upboard-golang upboard-node upboard-python upboard-openjdk \
	upboard-alpine upboard-alpine-buildpack-deps upboard-alpine-golang upboard-alpine-node upboard-alpine-python upboard-alpine-openjdk \
	kitra710-debian kitra710-buildpack-deps kitra710-golang kitra710-node kitra710-python kitra710-openjdk \
	kitra710-alpine kitra710-alpine-buildpack-deps kitra710-alpine-golang kitra710-alpine-node kitra710-alpine-python kitra710-alpine-openjdk \
	kitra710-fedora kitra710-fedora-buildpack-deps kitra710-fedora-golang kitra710-fedora-node kitra710-fedora-python kitra710-fedora-openjdk \
	imx6ul-var-dart-debian imx6ul-var-dart-buildpack-deps imx6ul-var-dart-golang imx6ul-var-dart-node imx6ul-var-dart-python imx6ul-var-dart-openjdk \
	imx6ul-var-dart-alpine imx6ul-var-dart-alpine-buildpack-deps imx6ul-var-dart-alpine-golang imx6ul-var-dart-alpine-node imx6ul-var-dart-alpine-python imx6ul-var-dart-alpine-openjdk \
	imx6ul-var-dart-fedora imx6ul-var-dart-fedora-buildpack-deps imx6ul-var-dart-fedora-golang imx6ul-var-dart-fedora-node imx6ul-var-dart-fedora-python imx6ul-var-dart-fedora-openjdk \
	ccon-01-debian ccon-01-buildpack-deps ccon-01-golang ccon-01-node ccon-01-python ccon-01-openjdk \
	ccon-01-alpine ccon-01-alpine-buildpack-deps ccon-01-alpine-golang ccon-01-alpine-node ccon-01-alpine-python ccon-01-alpine-openjdk \
	ccon-01-fedora ccon-01-fedora-buildpack-deps ccon-01-fedora-golang ccon-01-fedora-node ccon-01-fedora-python ccon-01-fedora-openjdk

# Jenkins build steps
docker build -t docs-updater .

for REPO in $REPOS
do
	ARGV="resin/$REPO"
	docker run docs-updater -u $USERNAME -p $PASSWORD $ARGV
    
done
