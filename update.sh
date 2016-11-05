#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"
helperDir='.template-helpers'

repos=( "$@" )
if [ ${#repos[@]} -eq 0 ]; then
	repos=( */ )
fi
repos=( "${repos[@]%/}" )

replace_field() {
	repo="$1"
	field="$2"
	content="$3"
	extraSed="${4:-}"
	sed_escaped_value="$(echo "$content" | sed 's/[\/&]/\\&/g')"
	sed_escaped_value="${sed_escaped_value//$'\n'/\\n}"
	sed -ri "s/${extraSed}%%${field}%%${extraSed}/$sed_escaped_value/g" "$repo/README.md"
}

declare -A otherRepos=(
	[i386-systemd]='https://github.com/resin-io-library/base-images'
	[armv7hf-systemd]='https://github.com/resin-io-library/base-images'
	[raspberrypi-systemd]='https://github.com/resin-io-library/base-images'
	[amd64-systemd]='https://github.com/resin-io-library/base-images'
	[armel-systemd]='https://github.com/resin-io-library/base-images'
	[raspberrypi-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[raspberrypi-node]='https://github.com/resin-io-library/base-images'
	[raspberrypi-python]='https://github.com/resin-io-library/base-images'
	[raspberrypi-golang]='https://github.com/resin-io-library/base-images'
	[raspberrypi2-debian]='https://github.com/resin-io-library/base-images'
	[raspberrypi2-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[raspberrypi2-node]='https://github.com/resin-io-library/base-images'
	[raspberrypi2-python]='https://github.com/resin-io-library/base-images'
	[raspberrypi2-golang]='https://github.com/resin-io-library/base-images'
	[beaglebone-debian]='https://github.com/resin-io-library/base-images'
	[beaglebone-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[beaglebone-node]='https://github.com/resin-io-library/base-images'
	[beaglebone-python]='https://github.com/resin-io-library/base-images'
	[beaglebone-golang]='https://github.com/resin-io-library/base-images'
	[edison-debian]='https://github.com/resin-io-library/base-images'
	[edison-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[edison-node]='https://github.com/resin-io-library/base-images'
	[edison-python]='https://github.com/resin-io-library/base-images'
	[edison-golang]='https://github.com/resin-io-library/base-images'
	[cubox-i-debian]='https://github.com/resin-io-library/base-images'
	[cubox-i-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[cubox-i-node]='https://github.com/resin-io-library/base-images'
	[cubox-i-python]='https://github.com/resin-io-library/base-images'
	[cubox-i-golang]='https://github.com/resin-io-library/base-images'
	[nitrogen6x-debian]='https://github.com/resin-io-library/base-images'
	[nitrogen6x-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[nitrogen6x-node]='https://github.com/resin-io-library/base-images'
	[nitrogen6x-python]='https://github.com/resin-io-library/base-images'
	[nitrogen6x-golang]='https://github.com/resin-io-library/base-images'
	[nuc-debian]='https://github.com/resin-io-library/base-images'
	[nuc-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[nuc-node]='https://github.com/resin-io-library/base-images'
	[nuc-python]='https://github.com/resin-io-library/base-images'
	[nuc-golang]='https://github.com/resin-io-library/base-images'
	[odroid-c1-debian]='https://github.com/resin-io-library/base-images'
	[odroid-c1-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[odroid-c1-node]='https://github.com/resin-io-library/base-images'
	[odroid-c1-python]='https://github.com/resin-io-library/base-images'
	[odroid-c1-golang]='https://github.com/resin-io-library/base-images'
	[odroid-ux3-debian]='https://github.com/resin-io-library/base-images'
	[odroid-ux3-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[odroid-ux3-node]='https://github.com/resin-io-library/base-images'
	[odroid-ux3-python]='https://github.com/resin-io-library/base-images'
	[odroid-ux3-golang]='https://github.com/resin-io-library/base-images'
	[parallella-hdmi-resin-debian]='https://github.com/resin-io-library/base-images'
	[parallella-hdmi-resin-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[parallella-hdmi-resin-node]='https://github.com/resin-io-library/base-images'
	[parallella-hdmi-resin-python]='https://github.com/resin-io-library/base-images'
	[parallella-hdmi-resin-golang]='https://github.com/resin-io-library/base-images'
	[ts4900-debian]='https://github.com/resin-io-library/base-images'
	[ts4900-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[ts4900-node]='https://github.com/resin-io-library/base-images'
	[ts4900-python]='https://github.com/resin-io-library/base-images'
	[ts4900-golang]='https://github.com/resin-io-library/base-images'
	[vab820-quad-debian]='https://github.com/resin-io-library/base-images'
	[vab820-quad-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[vab820-quad-node]='https://github.com/resin-io-library/base-images'
	[vab820-quad-python]='https://github.com/resin-io-library/base-images'
	[vab820-quad-golang]='https://github.com/resin-io-library/base-images'
	[zc702-zynq7-debian]='https://github.com/resin-io-library/base-images'
	[zc702-zynq7-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[zc702-zynq7-node]='https://github.com/resin-io-library/base-images'
	[zc702-zynq7-python]='https://github.com/resin-io-library/base-images'
	[zc702-zynq7-golang]='https://github.com/resin-io-library/base-images'
	[ts7700-debian]='https://github.com/resin-io-library/base-images'
	[ts7700-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[ts7700-node]='https://github.com/resin-io-library/base-images'
	[ts7700-python]='https://github.com/resin-io-library/base-images'
	[ts7700-golang]='https://github.com/resin-io-library/base-images'
	[raspberrypi3-debian]='https://github.com/resin-io-library/base-images'
	[raspberrypi3-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[raspberrypi3-node]='https://github.com/resin-io-library/base-images'
	[raspberrypi3-python]='https://github.com/resin-io-library/base-images'
	[raspberrypi3-golang]='https://github.com/resin-io-library/base-images'
	[beaglebone-green-wifi-debian]='https://github.com/resin-io-library/base-images'
	[beaglebone-green-wifi-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[beaglebone-green-wifi-python]='https://github.com/resin-io-library/base-images'
	[beaglebone-green-wifi-node]='https://github.com/resin-io-library/base-images'
	[beaglebone-green-wifi-golang]='https://github.com/resin-io-library/base-images'
	[apalis-imx6-debian]='https://github.com/resin-io-library/base-images'
	[apalis-imx6-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[apalis-imx6-node]='https://github.com/resin-io-library/base-images'
	[apalis-imx6-python]='https://github.com/resin-io-library/base-images'
	[apalis-imx6-golang]='https://github.com/resin-io-library/base-images'
	[artik10-debian]='https://github.com/resin-io-library/base-images'
	[artik10-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[artik10-node]='https://github.com/resin-io-library/base-images'
	[artik10-python]='https://github.com/resin-io-library/base-images'
	[artik10-golang]='https://github.com/resin-io-library/base-images'
	[artik5-debian]='https://github.com/resin-io-library/base-images'
	[artik5-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[artik5-node]='https://github.com/resin-io-library/base-images'
	[artik5-python]='https://github.com/resin-io-library/base-images'
	[artik5-golang]='https://github.com/resin-io-library/base-images'
	[colibri-imx6-debian]='https://github.com/resin-io-library/base-images'
	[colibri-imx6-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[colibri-imx6-node]='https://github.com/resin-io-library/base-images'
	[colibri-imx6-python]='https://github.com/resin-io-library/base-images'
	[colibri-imx6-golang]='https://github.com/resin-io-library/base-images'
	[raspberrypi-alpine-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[raspberrypi-alpine-node]='https://github.com/resin-io-library/base-images'
	[raspberrypi-alpine-python]='https://github.com/resin-io-library/base-images'
	[raspberrypi-alpine-golang]='https://github.com/resin-io-library/base-images'
	[raspberrypi-alpine]='https://github.com/resin-io-library/base-images'
	[raspberrypi2-alpine]='https://github.com/resin-io-library/base-images'
	[raspberrypi2-alpine-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[raspberrypi2-alpine-node]='https://github.com/resin-io-library/base-images'
	[raspberrypi2-alpine-python]='https://github.com/resin-io-library/base-images'
	[raspberrypi2-alpine-golang]='https://github.com/resin-io-library/base-images'
	[beaglebone-alpine]='https://github.com/resin-io-library/base-images'
	[beaglebone-alpine-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[beaglebone-alpine-node]='https://github.com/resin-io-library/base-images'
	[beaglebone-alpine-python]='https://github.com/resin-io-library/base-images'
	[beaglebone-alpine-golang]='https://github.com/resin-io-library/base-images'
	[edison-alpine]='https://github.com/resin-io-library/base-images'
	[edison-alpine-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[edison-alpine-node]='https://github.com/resin-io-library/base-images'
	[edison-alpine-python]='https://github.com/resin-io-library/base-images'
	[edison-alpine-golang]='https://github.com/resin-io-library/base-images'
	[cubox-i-alpine]='https://github.com/resin-io-library/base-images'
	[cubox-i-alpine-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[cubox-i-alpine-node]='https://github.com/resin-io-library/base-images'
	[cubox-i-alpine-python]='https://github.com/resin-io-library/base-images'
	[cubox-i-alpine-golang]='https://github.com/resin-io-library/base-images'
	[nitrogen6x-alpine]='https://github.com/resin-io-library/base-images'
	[nitrogen6x-alpine-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[nitrogen6x-alpine-node]='https://github.com/resin-io-library/base-images'
	[nitrogen6x-alpine-python]='https://github.com/resin-io-library/base-images'
	[nitrogen6x-alpine-golang]='https://github.com/resin-io-library/base-images'
	[nuc-alpine]='https://github.com/resin-io-library/base-images'
	[nuc-alpine-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[nuc-alpine-node]='https://github.com/resin-io-library/base-images'
	[nuc-alpine-python]='https://github.com/resin-io-library/base-images'
	[nuc-alpine-golang]='https://github.com/resin-io-library/base-images'
	[odroid-c1-alpine]='https://github.com/resin-io-library/base-images'
	[odroid-c1-alpine-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[odroid-c1-alpine-node]='https://github.com/resin-io-library/base-images'
	[odroid-c1-alpine-python]='https://github.com/resin-io-library/base-images'
	[odroid-c1-alpine-golang]='https://github.com/resin-io-library/base-images'
	[odroid-ux3-alpine]='https://github.com/resin-io-library/base-images'
	[odroid-ux3-alpine-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[odroid-ux3-alpine-node]='https://github.com/resin-io-library/base-images'
	[odroid-ux3-alpine-python]='https://github.com/resin-io-library/base-images'
	[odroid-ux3-alpine-golang]='https://github.com/resin-io-library/base-images'
	[parallella-hdmi-resin-alpine]='https://github.com/resin-io-library/base-images'
	[parallella-hdmi-resin-alpine-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[parallella-hdmi-resin-alpine-node]='https://github.com/resin-io-library/base-images'
	[parallella-hdmi-resin-alpine-python]='https://github.com/resin-io-library/base-images'
	[parallella-hdmi-resin-alpine-golang]='https://github.com/resin-io-library/base-images'
	[ts4900-alpine]='https://github.com/resin-io-library/base-images'
	[ts4900-alpine-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[ts4900-alpine-node]='https://github.com/resin-io-library/base-images'
	[ts4900-alpine-python]='https://github.com/resin-io-library/base-images'
	[ts4900-alpine-golang]='https://github.com/resin-io-library/base-images'
	[vab820-quad-alpine]='https://github.com/resin-io-library/base-images'
	[vab820-quad-alpine-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[vab820-quad-alpine-node]='https://github.com/resin-io-library/base-images'
	[vab820-quad-alpine-python]='https://github.com/resin-io-library/base-images'
	[vab820-quad-alpine-golang]='https://github.com/resin-io-library/base-images'
	[zc702-zynq7-alpine]='https://github.com/resin-io-library/base-images'
	[zc702-zynq7-alpine-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[zc702-zynq7-alpine-node]='https://github.com/resin-io-library/base-images'
	[zc702-zynq7-alpine-python]='https://github.com/resin-io-library/base-images'
	[zc702-zynq7-alpine-golang]='https://github.com/resin-io-library/base-images'
	[ts7700-alpine]='https://github.com/resin-io-library/base-images'
	[ts7700-alpine-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[ts7700-alpine-node]='https://github.com/resin-io-library/base-images'
	[ts7700-alpine-python]='https://github.com/resin-io-library/base-images'
	[ts7700-alpine-golang]='https://github.com/resin-io-library/base-images'
	[raspberrypi3-alpine]='https://github.com/resin-io-library/base-images'
	[raspberrypi3-alpine-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[raspberrypi3-alpine-node]='https://github.com/resin-io-library/base-images'
	[raspberrypi3-alpine-python]='https://github.com/resin-io-library/base-images'
	[raspberrypi3-alpine-golang]='https://github.com/resin-io-library/base-images'
	[beaglebone-green-wifi-alpine]='https://github.com/resin-io-library/base-images'
	[beaglebone-green-wifi-alpine-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[beaglebone-green-wifi-alpine-python]='https://github.com/resin-io-library/base-images'
	[beaglebone-green-wifi-alpine-node]='https://github.com/resin-io-library/base-images'
	[beaglebone-green-wifi-alpine-golang]='https://github.com/resin-io-library/base-images'
	[apalis-imx6-alpine]='https://github.com/resin-io-library/base-images'
	[apalis-imx6-alpine-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[apalis-imx6-alpine-node]='https://github.com/resin-io-library/base-images'
	[apalis-imx6-alpine-python]='https://github.com/resin-io-library/base-images'
	[apalis-imx6-alpine-golang]='https://github.com/resin-io-library/base-images'
	[artik10-alpine]='https://github.com/resin-io-library/base-images'
	[artik10-alpine-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[artik10-alpine-node]='https://github.com/resin-io-library/base-images'
	[artik10-alpine-python]='https://github.com/resin-io-library/base-images'
	[artik10-alpine-golang]='https://github.com/resin-io-library/base-images'
	[artik5-alpine]='https://github.com/resin-io-library/base-images'
	[artik5-alpine-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[artik5-alpine-node]='https://github.com/resin-io-library/base-images'
	[artik5-alpine-python]='https://github.com/resin-io-library/base-images'
	[artik5-alpine-golang]='https://github.com/resin-io-library/base-images'
	[colibri-imx6-alpine]='https://github.com/resin-io-library/base-images'
	[colibri-imx6-alpine-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[colibri-imx6-alpine-node]='https://github.com/resin-io-library/base-images'
	[colibri-imx6-alpine-python]='https://github.com/resin-io-library/base-images'
	[colibri-imx6-alpine-golang]='https://github.com/resin-io-library/base-images'
	[raspberrypi2-fedora]='https://github.com/resin-io-library/base-images'
	[raspberrypi2-fedora-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[raspberrypi2-fedora-node]='https://github.com/resin-io-library/base-images'
	[raspberrypi2-fedora-python]='https://github.com/resin-io-library/base-images'
	[raspberrypi2-fedora-golang]='https://github.com/resin-io-library/base-images'
	[beaglebone-fedora]='https://github.com/resin-io-library/base-images'
	[beaglebone-fedora-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[beaglebone-fedora-node]='https://github.com/resin-io-library/base-images'
	[beaglebone-fedora-python]='https://github.com/resin-io-library/base-images'
	[beaglebone-fedora-golang]='https://github.com/resin-io-library/base-images'
	[edison-fedora]='https://github.com/resin-io-library/base-images'
	[edison-fedora-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[edison-fedora-node]='https://github.com/resin-io-library/base-images'
	[edison-fedora-python]='https://github.com/resin-io-library/base-images'
	[edison-fedora-golang]='https://github.com/resin-io-library/base-images'
	[cubox-i-fedora]='https://github.com/resin-io-library/base-images'
	[cubox-i-fedora-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[cubox-i-fedora-node]='https://github.com/resin-io-library/base-images'
	[cubox-i-fedora-python]='https://github.com/resin-io-library/base-images'
	[cubox-i-fedora-golang]='https://github.com/resin-io-library/base-images'
	[nitrogen6x-fedora]='https://github.com/resin-io-library/base-images'
	[nitrogen6x-fedora-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[nitrogen6x-fedora-node]='https://github.com/resin-io-library/base-images'
	[nitrogen6x-fedora-python]='https://github.com/resin-io-library/base-images'
	[nitrogen6x-fedora-golang]='https://github.com/resin-io-library/base-images'
	[odroid-c1-fedora]='https://github.com/resin-io-library/base-images'
	[odroid-c1-fedora-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[odroid-c1-fedora-node]='https://github.com/resin-io-library/base-images'
	[odroid-c1-fedora-python]='https://github.com/resin-io-library/base-images'
	[odroid-c1-fedora-golang]='https://github.com/resin-io-library/base-images'
	[odroid-ux3-fedora]='https://github.com/resin-io-library/base-images'
	[odroid-ux3-fedora-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[odroid-ux3-fedora-node]='https://github.com/resin-io-library/base-images'
	[odroid-ux3-fedora-python]='https://github.com/resin-io-library/base-images'
	[odroid-ux3-fedora-golang]='https://github.com/resin-io-library/base-images'
	[parallella-hdmi-resin-fedora]='https://github.com/resin-io-library/base-images'
	[parallella-hdmi-resin-fedora-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[parallella-hdmi-resin-fedora-node]='https://github.com/resin-io-library/base-images'
	[parallella-hdmi-resin-fedora-python]='https://github.com/resin-io-library/base-images'
	[parallella-hdmi-resin-fedora-golang]='https://github.com/resin-io-library/base-images'
	[ts4900-fedora]='https://github.com/resin-io-library/base-images'
	[ts4900-fedora-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[ts4900-fedora-node]='https://github.com/resin-io-library/base-images'
	[ts4900-fedora-python]='https://github.com/resin-io-library/base-images'
	[ts4900-fedora-golang]='https://github.com/resin-io-library/base-images'
	[vab820-quad-fedora]='https://github.com/resin-io-library/base-images'
	[vab820-quad-fedora-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[vab820-quad-fedora-node]='https://github.com/resin-io-library/base-images'
	[vab820-quad-fedora-python]='https://github.com/resin-io-library/base-images'
	[vab820-quad-fedora-golang]='https://github.com/resin-io-library/base-images'
	[zc702-zynq7-fedora]='https://github.com/resin-io-library/base-images'
	[zc702-zynq7-fedora-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[zc702-zynq7-fedora-node]='https://github.com/resin-io-library/base-images'
	[zc702-zynq7-fedora-python]='https://github.com/resin-io-library/base-images'
	[zc702-zynq7-fedora-golang]='https://github.com/resin-io-library/base-images'
	[raspberrypi3-fedora]='https://github.com/resin-io-library/base-images'
	[raspberrypi3-fedora-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[raspberrypi3-fedora-node]='https://github.com/resin-io-library/base-images'
	[raspberrypi3-fedora-python]='https://github.com/resin-io-library/base-images'
	[raspberrypi3-fedora-golang]='https://github.com/resin-io-library/base-images'
	[beaglebone-green-wifi-fedora]='https://github.com/resin-io-library/base-images'
	[beaglebone-green-wifi-fedora-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[beaglebone-green-wifi-fedora-python]='https://github.com/resin-io-library/base-images'
	[beaglebone-green-wifi-fedora-node]='https://github.com/resin-io-library/base-images'
	[beaglebone-green-wifi-fedora-golang]='https://github.com/resin-io-library/base-images'
	[apalis-imx6-fedora]='https://github.com/resin-io-library/base-images'
	[apalis-imx6-fedora-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[apalis-imx6-fedora-node]='https://github.com/resin-io-library/base-images'
	[apalis-imx6-fedora-python]='https://github.com/resin-io-library/base-images'
	[apalis-imx6-fedora-golang]='https://github.com/resin-io-library/base-images'
	[artik10-fedora]='https://github.com/resin-io-library/base-images'
	[artik10-fedora-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[artik10-fedora-node]='https://github.com/resin-io-library/base-images'
	[artik10-fedora-python]='https://github.com/resin-io-library/base-images'
	[artik10-fedora-golang]='https://github.com/resin-io-library/base-images'
	[artik5-fedora]='https://github.com/resin-io-library/base-images'
	[artik5-fedora-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[artik5-fedora-node]='https://github.com/resin-io-library/base-images'
	[artik5-fedora-python]='https://github.com/resin-io-library/base-images'
	[artik5-fedora-golang]='https://github.com/resin-io-library/base-images'
	[colibri-imx6-fedora]='https://github.com/resin-io-library/base-images'
	[colibri-imx6-fedora-buildpack-deps]='https://github.com/resin-io-library/base-images'
	[colibri-imx6-fedora-node]='https://github.com/resin-io-library/base-images'
	[colibri-imx6-fedora-python]='https://github.com/resin-io-library/base-images'
	[colibri-imx6-fedora-golang]='https://github.com/resin-io-library/base-images'
)

dockerLatest="$(curl -sSL 'https://get.docker.com/latest')"

for repo in "${repos[@]}"; do
	if [ -x "$repo/update.sh" ]; then
		( set -x; "$repo/update.sh" )
	fi
	
	if [ -e "$repo/content.md" ]; then
		gitRepo="${otherRepos[$repo]}"
		if [ -z "$gitRepo" ]; then
			gitRepo="https://github.com/resin-io-library/$repo"
		fi
		
		mailingList="$(cat "$repo/mailing-list.md" 2>/dev/null || true)"
		if [ "$mailingList" ]; then
			mailingList=" $mailingList "
		else
			mailingList=' '
		fi
		
		dockerVersions="$(cat "$repo/docker-versions.md" 2>/dev/null || cat "$helperDir/docker-versions.md")"
		
		userFeedback="$(cat "$repo/user-feedback.md" 2>/dev/null || cat "$helperDir/user-feedback.md")"
		
		license="$(cat "$repo/license.md" 2>/dev/null || true)"
		if [ "$license" ]; then
			license=$'\n\n''# License'$'\n\n'"$license"
		fi
		
		logo=
		if [ -e "$repo/logo.png" ]; then
			logo="![logo](https://raw.githubusercontent.com/resin-io-library/docs/master/$repo/logo.png)"
		fi
		
		compose=
		composeYml=
		if [ -f "$repo/docker-compose.yml" ]; then
			compose="$(cat "$repo/compose.md" 2>/dev/null || cat "$helperDir/compose.md")"
			composeYml="$(sed 's/^/\t/' "$repo/docker-compose.yml")"
		fi
		
		cp -v "$helperDir/template.md" "$repo/README.md"
		
		echo '  TAGS => generate-dockerfile-links-partial.sh'
		replace_field "$repo" 'TAGS' "$("$helperDir/generate-dockerfile-links-partial.sh" "$repo")"
		
		echo '  CONTENT => '"$repo"'/content.md'
		replace_field "$repo" 'CONTENT' "$(cat "$repo/content.md")"
		
		# has to be after CONTENT because it's contained in content.md
		echo "  LOGO => $logo"
		replace_field "$repo" 'LOGO' "$logo" '\s*'
		
		echo '  COMPOSE => '"$repo"'/compose.md'
		replace_field "$repo" 'COMPOSE' "$compose"
		
		echo '  COMPOSE-YML => '"$repo"'/docker-compose.yml'
		replace_field "$repo" 'COMPOSE-YML' "$composeYml"
		
		echo '  DOCKER-VERSIONS => '"$repo"'/docker-versions.md'
		replace_field "$repo" 'DOCKER-VERSIONS' "$dockerVersions"
		
		echo '  DOCKER-LATEST => "'"$dockerLatest"'"'
		replace_field "$repo" 'DOCKER-LATEST' "$dockerLatest"
		
		echo '  LICENSE => '"$repo"'/license.md'
		replace_field "$repo" 'LICENSE' "$license"
		
		echo '  USER-FEEDBACK => '"$repo"'/user-feedback.md'
		replace_field "$repo" 'USER-FEEDBACK' "$userFeedback"
		
		echo '  MAILING-LIST => '"$repo"'/mailing-list.md'
		replace_field "$repo" 'MAILING-LIST' "$mailingList" '\s*'
		
		echo '  REPO => "'"$repo"'"'
		replace_field "$repo" 'REPO' "$repo"
		
		echo '  GITHUB-REPO => "'"$gitRepo"'"'
		replace_field "$repo" 'GITHUB-REPO' "$gitRepo"
		
		echo
	else
		echo >&2 "skipping $repo: missing repo/content.md"
	fi
done
