FROM rocker/binder

USER root
RUN apt-get update && apt-get -y install python-pip libgeos-dev \
&& pip install geos matplotlib numpy pandas retriever==2.* seaborn macroecotools \
&& pip install https://github.com/matplotlib/basemap/archive/v1.1.0.tar.gz
## Copies your repo files into the Docker Container

COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}

## Become normal user again
USER ${NB_USER}

