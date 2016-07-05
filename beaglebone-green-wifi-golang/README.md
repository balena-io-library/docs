# Supported tags and respective `Dockerfile` links

-	[`1.4.3`, `1.4` (*golang/beaglebone/1.4/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/22e06093d343189f1d7c0b1c6904528638a99640/golang/beaglebone/1.4/Dockerfile)
-	[`1.4.3-slim`, `1.4-slim` (*golang/beaglebone/1.4/slim/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/22e06093d343189f1d7c0b1c6904528638a99640/golang/beaglebone/1.4/slim/Dockerfile)
-	[`1.4.3-wheezy`, `1.4-wheezy` (*golang/beaglebone/1.4/wheezy/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/bd2ed2c82109c22cfab5b07b1b312b8e6450e643/golang/beaglebone/1.4/wheezy/Dockerfile)
-	[`1.5.2`, `1.5`, `0`, `latest` (*golang/beaglebone/1.5/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/22e06093d343189f1d7c0b1c6904528638a99640/golang/beaglebone/1.5/Dockerfile)
-	[`1.5.2-slim`, `1.5-slim`, `0-slim`, `slim` (*golang/beaglebone/1.5/slim/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/22e06093d343189f1d7c0b1c6904528638a99640/golang/beaglebone/1.5/slim/Dockerfile)
-	[`1.5.2-wheezy`, `1.5-wheezy`, `0-wheezy`, `wheezy` (*golang/beaglebone/1.5/wheezy/Dockerfile*)](https://github.com/resin-io-library/base-images/blob/5dfce6ddcc6095da54a5e59ee35e0a208891b82b/golang/beaglebone/1.5/wheezy/Dockerfile)

For more information about this image and its history, please see the [relevant manifest file (`resin/beaglebone-golang`)](https://github.com/resin-io-library/official-images/blob/master/library/beaglebone-golang) in the [`resin-io-library/official-images` GitHub repo](https://github.com/resin-io-library/official-images).

# What is Go?

Go (a.k.a., Golang) is a programming language first developed at Google. It is a statically-typed language with syntax loosely derived from C, but with additional features such as garbage collection, type safety, some dynamic-typing capabilities, additional built-in types (e.g., variable-length arrays and key-value maps), and a large standard library.

> [wikipedia.org/wiki/Go_(programming_language)](http://en.wikipedia.org/wiki/Go_%28programming_language%29)

![logo](https://raw.githubusercontent.com/resin-io-library/docs/master/beaglebone-golang/logo.png)

## Variants:

The `golang` images come in many flavors, each designed for a specific use case.

* `golang:<version>`

This is the defacto image. If you are unsure about what your needs are, you probably want to use this one. It is designed to be used both as a throw away container (mount your source code and start the container to start your app), as well as the base to build other images off of. This tag is based off of [buildpack-deps](#buildpack-deps). `buildpack-deps` is designed for the average user of docker who has many images on their system. It, by design, has a large number of extremely common Debian packages. This reduces the number of packages that images that derive from it need to install, thus reducing the overall size of all images on your system.

* `golang:<version>-slim`

This image does not contain the common packages contained in the default tag and only contains the minimal packages needed to run Go. Unless you are working in an environment where only the Go image will be deployed and you have space constraints, we highly recommend using the default image of this repository.

## Notes:

* Default working directory (WORKDIR) and `$GOPATH` is `/go`, Go projects should be copied there. If you want to copy your projects to different place, you need to set `$GOPATH` by yourself.

* ARM Qemu and Go don't work together properly, so we highly recommend our users to build your Go projects on the device (only ARM devices, you do not need to do this for other platforms), not during build time. Otherwise, the build will potentially fail. You can have a script to build and run Go projects and use Docker CMD command to run it.

# License

View [license information](http://golang.org/LICENSE) for the software contained in this image.

# Supported Docker versions

This image is officially supported on Docker version 1.9.1.

Support for older versions (down to 1.0) is provided on a best-effort basis.

# User Feedback

## Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/resin-io-library/base-images/issues).

## Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/resin-io-library/base-images/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.
