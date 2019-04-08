FROM jupyter/minimal-notebook
LABEL maintainer="Klaus Harbo <klaus@harbo.net>"

ARG NB_USER=jovyan
ENV NOTEBOOK_PATH $HOME/notebooks
ENV PORT 8888
ENV CLOJUPYTER_PATH $HOME/clojupyter
ENV LEIN_ROOT 1

USER root
RUN    	apt update \
	&& apt-get install -y curl openjdk-8-jdk \
	&& curl -o /usr/local/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein \
 	&& chmod +x /usr/local/bin/lein \
 	&& lein self-install

USER ${NB_USER}
WORKDIR ${HOME}
RUN	mkdir -p $NOTEBOOK_PATH \
 	&& git clone https://github.com/clojupyter/clojupyter $CLOJUPYTER_PATH

WORKDIR $CLOJUPYTER_PATH
RUN git checkout v0.2.2 \
 	&& git fetch \
 	&& make \
 	&& make install

WORKDIR $NOTEBOOK_PATH
EXPOSE $PORT
VOLUME $NOTEBOOK_PATH
CMD ["jupyter", "notebook", "--ip=0.0.0.0"]
