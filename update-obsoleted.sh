#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

repos='rpi-nodejs rpi-node armv7hf-node rpi-buildpack-deps armv7hf-buildpack-deps i386-node i386-buildpack-deps armel-node amd64-node'

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
