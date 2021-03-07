FROM clojupyter-base
LABEL maintainer="Andrew Whitehouse <andrew@whitehouse.org.uk>"

ARG NB_USER=jupyter
ARG CLOJUPYTER_VERSION=0.3.2

ENV NOTEBOOK_PATH $HOME/notebooks
ENV PORT 8888
ENV LEIN_ROOT 1
ENV CLOJUPYTER_PATH $HOME/clojupyter-$CLOJUPYTER_VERSION

USER $NB_USER
RUN	git clone https://github.com/clojupyter/clojupyter $CLOJUPYTER_PATH

WORKDIR $CLOJUPYTER_PATH
RUN git checkout $CLOJUPYTER_VERSION \
	&& make install
RUN npm install -g ijavascript \
  && ijsinstall

RUN mkdir $NOTEBOOK_PATH
WORKDIR $NOTEBOOK_PATH

EXPOSE $PORT
VOLUME $NOTEBOOK_PATH
CMD ["jupyter", "notebook", "--log-level=ERROR"]
