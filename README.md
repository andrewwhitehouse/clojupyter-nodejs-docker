# clojupyter docker image


This is a non-official ``Dockerfile`` for [clojupyter](https://github.com/clojupyter/clojupyter) based on https://github.com/klausharbo/clojupyter-docker.

I've added support for JavaScript, and (in release 0.4.3) updated to Clojure version 1.10.2.796 using the instructions in the [Getting Started](https://clojure.org/guides/getting_started) page.

## Usage

This project is already published on Docker hub.  The absolutely simplest way to run the image is
doing

```sh
docker run -p 8888:8888 --rm andrewwhitehouse/clojupyter:0.4.3
```

and following the instruction to connect to the server.  This will give an empty folder where you
can create notebooks from scratch.  The notebooks will be inside the container and disappear when it
terminates.

To access existing notebooks and/or keep notebooks after the container terminates you can map an
directory on the host machine into the `notebooks` directory in the container:

```sh
docker run -p 8888:8888 \
	-v /path/to/folder:/home/jovyan/notebooks \
	--rm andrewwhitehouse/clojupyter:0.4.3
```

(I still haven't figured out why the home directory is "jovyan"; I'll eventually get around to making that more generic. But if works.)


If you want to load and use external libraries, mapping `$HOME/.m2` into the container will yield
much better performance:

```sh
docker run -p 8888:8888 \
	-v $HOME/.m2:/home/jovyan/.m2 \
	-v /path/to/folder:/home/jovyan/notebooks \
	--rm andrewwhitehouse/clojupyter:0.4.3
```

## Building the image

To build an image of clojupyter version `0.4.3` :

```sh
cd clojupyter; build.sh
```
