# Supported tags and respective `Dockerfile` links

-	[`jessie-curl`, `curl` (*armv7hf/jessie/curl/Dockerfile*)](https://github.com/resin-io-library/buildpack-deps/blob/8fbe6864378a6b04678ab6efed76f22b13bfdf0f/armv7hf/jessie/curl/Dockerfile)
-	[`jessie-scm`, `scm` (*armv7hf/jessie/scm/Dockerfile*)](https://github.com/resin-io-library/buildpack-deps/blob/8fbe6864378a6b04678ab6efed76f22b13bfdf0f/armv7hf/jessie/scm/Dockerfile)
-	[`jessie`, `latest` (*armv7hf/jessie/Dockerfile*)](https://github.com/resin-io-library/buildpack-deps/blob/8fbe6864378a6b04678ab6efed76f22b13bfdf0f/armv7hf/jessie/Dockerfile)
-	[`sid-curl` (*armv7hf/sid/curl/Dockerfile*)](https://github.com/resin-io-library/buildpack-deps/blob/8fbe6864378a6b04678ab6efed76f22b13bfdf0f/armv7hf/sid/curl/Dockerfile)
-	[`sid-scm` (*armv7hf/sid/scm/Dockerfile*)](https://github.com/resin-io-library/buildpack-deps/blob/8fbe6864378a6b04678ab6efed76f22b13bfdf0f/armv7hf/sid/scm/Dockerfile)
-	[`sid` (*armv7hf/sid/Dockerfile*)](https://github.com/resin-io-library/buildpack-deps/blob/8fbe6864378a6b04678ab6efed76f22b13bfdf0f/armv7hf/sid/Dockerfile)
-	[`wheezy-curl` (*armv7hf/wheezy/curl/Dockerfile*)](https://github.com/resin-io-library/buildpack-deps/blob/8fbe6864378a6b04678ab6efed76f22b13bfdf0f/armv7hf/wheezy/curl/Dockerfile)
-	[`wheezy-scm` (*armv7hf/wheezy/scm/Dockerfile*)](https://github.com/resin-io-library/buildpack-deps/blob/8fbe6864378a6b04678ab6efed76f22b13bfdf0f/armv7hf/wheezy/scm/Dockerfile)
-	[`wheezy` (*armv7hf/wheezy/Dockerfile*)](https://github.com/resin-io-library/buildpack-deps/blob/8fbe6864378a6b04678ab6efed76f22b13bfdf0f/armv7hf/wheezy/Dockerfile)

For more information about this image and its history, please see the [relevant manifest file (`resin/armv7hf-buildpack-deps`)](https://github.com/resin-io-library/official-images/blob/master/library/armv7hf-buildpack-deps) in the [`resin-io-library/official-images` GitHub repo](https://github.com/resin-io-library/official-images).

# What is `buildpack-deps`?

In spirit, `buildpack-deps` is similar to [Heroku's stack images](https://github.com/heroku/stack-images/blob/master/bin/cedar.sh). It includes a large number of "development header" packages needed by various things like Ruby Gems, PyPI modules, etc. For example, `buildpack-deps` would let you do a `bundle install` in an arbitrary application directory without knowing beforehand that `ssl.h` is required to build a dependent module.

![logo](https://raw.githubusercontent.com/resin-io-library/docs/master/armv7hf-buildpack-deps/logo.png)

# How to use this image

This stack is designed to be the foundation of a language-stack image.

## What's included?

The main tags of this image are the full batteries-included approach. With them, a majority of arbitrary `gem install` / `npm install` / `pip install` should be successfull without additional header/development packages.

For some language stacks, that doesn't make sense, particularly if linking to arbitrary external C libraries is much less common (as in Go and Java, for example), which is where these other smaller variants can come in handy.

### `curl`

This variant includes just the `curl`, `wget`, and `ca-certificates` packages. This is perfect for cases like the Java JRE, where downloading JARs is very common and necessary, but checking out code isn't.

### `scm`

This variant is based on `curl`, but also adds various source control management tools. As of this writing, the current list of included tools is `bzr`, `git`, `hg`, and `svn`. Intentionally missing is `cvs` due to the dwindling relevance it has (sorry CVS). This image is perfect for cases like the Java JDK, where downloading JARs is very common (hence the `curl` base still), but checking out code also becomes more common as well (compared to the JRE).

# License

View [license information](https://www.debian.org/social_contract#guidelines) for the software contained in this image.

# Supported Docker versions

This image is officially supported on Docker version 1.5.0.

Support for older versions (down to 1.0) is provided on a best-effort basis.

# User Feedback

## Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/resin-io-library/buildpack-deps/issues).

## Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/resin-io-library/buildpack-deps/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.
