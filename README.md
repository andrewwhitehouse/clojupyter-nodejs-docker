# clojupyter docker image

This is a non-official ``Dockerfile`` for [clojupyter](https://github.com/clojupyter/clojupyter) to
build a docker image to make it easy to try out the Clojupyter without having to install Jupyter
itself.  The image is intended primarily for demo purposes, most people will probably want to
install Jupyter and Clojupyter on their machine for real work.


## Usage

This project is already published on Docker hub.  The absolutely simplest way to run the image is
doing

```sh
docker run -p 8888:8888 --rm simplect/clojupyter:0.2.2
```

and following the instruction to connect to the server.  This will give an empty folder where you
can create notebooks from scratch.  The notebooks will be inside the container and disappear when it
terminates.

To access existing notebooks and/or keep notebooks after the container terminates you can map an
directory on the host machine into the `notebooks` directory in the container:

```sh
docker run -p 8888:8888 -v /path/to/folder:/home/jovyan/notebooks --rm simplect/clojupyter:0.2.2
```

If you want to load and use external libraries, mapping `$HOME/.m2` into the container will yield
much better performance:

```sh
docker run -p 8888:8888 \
	-v $HOME/.m2:/home/jovyan/.m2 \
	-v /path/to/folder:/home/jovyan/notebooks \
	--rm simplect/clojupyter:0.2.2
```

## Building the image

To build the image:

```sh
CLOJUPYTER_VERSION=0.2.2 make
```
