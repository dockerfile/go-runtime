## Go runtime Dockerfile


This repository contains **Dockerfile** of [Go programming language](http://golang.org/) runtime for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/dockerfile/go-runtime/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).

This image is a base image that makes it easy to dockerize standard golang applications.

It can automatically bundle a golang application with its dependencies and set the default command to the compiled binary with no additional Dockerfile instructions.

This project heavily borrowed code from Google's [google/golang-runtime](https://registry.hub.docker.com/u/google/golang-runtime/) Docker image.


### Base Docker Image

* [dockerfile/go](http://dockerfile.github.io/#/go)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/dockerfile/go-runtime/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull dockerfile/go-runtime`

   (alternatively, you can build an image from Dockerfile: `docker build -t="dockerfile/go-runtime" github.com/dockerfile/go-runtime`)


### Usage

This image assumes that your application:

* has a `main` package
* listens on port `8080`
* may have a `.godir` file containing the import path for your application if it vendors its dependencies

When building your application docker image, `ONBUILD` triggers fetch non-vendored dependencies of your application using `go get`.

* **Step 1**: Create a Dockerfile in your golang application directory with the following content:

```dockerfile
    FROM dockerfile/go-runtime
```

* **Step 2**: Build your container image by running the following command in your application directory:

```sh
    docker build -t="app" .
```

* **Step 3**: Run application by mapping port `8080`:

```sh
    APP=$(docker run -d -p 8080 app)
    PORT=$(docker port $APP 8080 | awk -F: '{print $2}')
    echo "Open http://localhost:$PORT/"
```
