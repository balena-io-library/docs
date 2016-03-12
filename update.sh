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
