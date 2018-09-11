# [![Binder](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/cboettig/diversity-conservation/master?urlpath=rstudio)


FROM rocker/binder:3.5.1

## Copies your repo files into the Docker Container
USER root
RUN apt-get update && apt-get -y install python-pip libgeos-dev \
&& pip install geos matplotlib numpy pandas retriever==2.* seaborn macroecotools \
&& pip install https://github.com/matplotlib/basemap/archive/v1.1.0.tar.gz

COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}

## Become normal user again
USER ${NB_USER}

