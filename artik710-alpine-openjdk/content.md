# What is OpenJDK?

OpenJDK (Open Java Development Kit) is a free and open source implementation of the Java Platform, Standard Edition (Java SE). OpenJDK is the official reference implementation of Java SE since version 7.

> [wikipedia.org/wiki/OpenJDK](http://en.wikipedia.org/wiki/OpenJDK)

Java is a registered trademark of Oracle and/or its affiliates.

%%LOGO%%

# How to use this image

## Start a Java instance in your app

The most straightforward way to use this image is to use a Java container as both the build and runtime environment. In your `Dockerfile`, writing something along the lines of the following will compile and run your project:

```dockerfile
FROM resin/artik710-alpine-openjdk:8
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN javac Main.java
CMD ["java", "Main"]
```

You can then run and build the Docker image:

```console
$ docker build -t my-java-app .
$ docker run -it --rm --name my-running-app my-java-app
```
