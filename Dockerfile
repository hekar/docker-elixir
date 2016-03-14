FROM ubuntu:15.10
MAINTAINER hekark@gmail.com
ENV DOWNLOAD_URL=https://packages.erlang-solutions.com/erlang/esl-erlang/FLAVOUR_1_general/esl-erlang_18.2-1~ubuntu~wily_amd64.deb

ENV DEBIAN_FRONTEND="noninteractive" \
  LANG="en_US.UTF-8" \
  LANGUAGE="en_US:en" \
  LS_ALL="en_US.UTF-8"

RUN mkdir /tmp/erlang-build && \
  cd /tmp/erlang-build && \
  locale-gen en_US.UTF-8 && \
  apt-get -q -y update && \
  apt-get -q -y install wget build-essential git && \
  wget $DOWNLOAD_URL -q -O erlang.deb && \
  dpkg -i erlang.deb; apt-get install -f -y -q && \
  cd /tmp/erlang-build && \
  git clone https://github.com/elixir-lang/elixir.git && \
  cd /tmp/erlang-build/elixir && \
  git checkout v1.2.0 && \
  make install && \
  cd $HOME && \
  rm -rf /tmp/erlang-build && \
  apt-get clean

WORKDIR $HOME
