FROM ubuntu:utopic

ENV DEBIAN_FRONTEND noninteractive
ENV DE_ERLANG 1:17.1-dfsg-4ubuntu2
ENV DE_ELIXIR v1.0.0-rc1

RUN apt-get -y update
RUN apt-get -y install wget build-essential git
RUN mkdir /tmp/erlang-build
WORKDIR /tmp/erlang-build
RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
RUN dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get -y update
RUN apt-get -y install erlang-base-hipe=$DE_ERLANG erlang-dev=$DE_ERLANG erlang=$DE_ERLANG erlang-asn1=$DE_ERLANG erlang-common-test=$DE_ERLANG erlang-corba=$DE_ERLANG erlang-crypto=$DE_ERLANG erlang-debugger=$DE_ERLANG erlang-dialyzer=$DE_ERLANG erlang-diameter=$DE_ERLANG erlang-edoc=$DE_ERLANG erlang-eldap=$DE_ERLANG erlang-erl-docgen=$DE_ERLANG erlang-et=$DE_ERLANG erlang-eunit=$DE_ERLANG erlang-gs=$DE_ERLANG erlang-ic=$DE_ERLANG erlang-inets=$DE_ERLANG erlang-megaco=$DE_ERLANG erlang-mnesia=$DE_ERLANG erlang-observer=$DE_ERLANG erlang-odbc=$DE_ERLANG erlang-os-mon=$DE_ERLANG erlang-parsetools=$DE_ERLANG erlang-percept=$DE_ERLANG erlang-pman=$DE_ERLANG erlang-public-key=$DE_ERLANG erlang-reltool=$DE_ERLANG erlang-runtime-tools=$DE_ERLANG erlang-snmp=$DE_ERLANG erlang-ssh=$DE_ERLANG erlang-ssl=$DE_ERLANG erlang-ssl=$DE_ERLANG erlang-syntax-tools=$DE_ERLANG erlang-test-server=$DE_ERLANG erlang-toolbar=$DE_ERLANG erlang-tools=$DE_ERLANG erlang-tv=$DE_ERLANG erlang-typer=$DE_ERLANG erlang-webtool=$DE_ERLANG erlang-xmerl=$DE_ERLANG erlang-src=$DE_ERLANG

RUN git clone git://github.com/rebar/rebar.git
WORKDIR /tmp/erlang-build/rebar
RUN ./bootstrap
RUN cp rebar /usr/local/bin/

WORKDIR /tmp/erlang-build/
RUN git clone https://github.com/elixir-lang/elixir.git
WORKDIR /tmp/erlang-build/elixir
RUN git checkout $DE_ELIXIR
RUN make install

WORKDIR /
RUN rm -rf /tmp/erlang-build
RUN apt-get clean
