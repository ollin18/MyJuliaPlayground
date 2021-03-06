FROM julia:0.7.0-stretch
MAINTAINER Ollin Demian Langle Chimal <Ollin.Langle@uvm.edu>
ENV REFRESHED_AT 2018-08-23

RUN apt-get update
RUN apt-get install -y gnupg python-docutils
RUN sh -c 'echo "deb http://cran.rstudio.com/bin/linux/debian stretch-cran34/" >> /etc/apt/sources.list'
RUN apt-get update && apt-get install -y build-essential ed sed
RUN apt-get install -y unzip curl openssl libssl-dev libcurl4-openssl-dev git python-pip libfreetype6-dev pkg-config python-dev autopoint gettext gettext-base libasprintf-dev libasprintf0v5 libcroco3 libgettextpo-dev libgettextpo0 libunistring0 gettext-doc gnupg
RUN apt-get install --force-yes -y r-base-core r-recommended r-base r-base-dev

ADD packages.R packages.R
ADD requirements.txt requirements.txt
ADD packages.sh packages.sh

RUN Rscript packages.R
RUN pip install matplotlib luigi
RUN sh packages.sh

RUN echo 'es_MX.UTF-8 UTF-8' >> /etc/locale.gen
RUN echo 'export es_MX.UTF-8 UTF-8' >> /.bashrc
RUN echo 'LANG=es_ES.UTF-8' >> /etc/locale.conf
RUN echo 'export LANG=es_ES.UTF-8' >> /.bashrc
RUN exec $SHELL

COPY src/ /src/

CMD ["julia"]
