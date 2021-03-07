FROM jupyter/minimal-notebook
LABEL maintainer="Klaus Harbo <klaus@harbo.net>"

ARG NB_USER=jupyter
ENV NOTEBOOK_PATH $HOME/notebooks
ENV PORT 8888
ENV CLOJUPYTER_PATH $HOME/clojupyter
ENV LEIN_ROOT 1

USER root
RUN    	apt-get update \
	&& apt-get install -y curl openjdk-8-jdk \
        && curl -o /usr/local/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein \
        && chmod +x /usr/local/bin/lein \
        && lein self-install \
        && curl -O https://download.clojure.org/install/linux-install-1.10.2.796.sh \
        && chmod +x linux-install-1.10.2.796.sh \
        && sudo ./linux-install-1.10.2.796.sh 
