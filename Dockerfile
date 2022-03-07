FROM hexpm/elixir:1.13.1-erlang-24.2.1-debian-bullseye-20210902-slim

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install git vim sudo inotify-tools postgresql-client

RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

RUN apt-get -y install nodejs npm && npm install -g npm

ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID devel
RUN useradd -u $UID -g devel -m devel
RUN echo "devel ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY --chown=devel:devel ./apps /apps

USER devel

RUN mix local.hex --force && \
  mix archive.install hex phx_new --force && \
  mix local.rebar --force

RUN echo alias \
  elixirc=\"/usr/local/bin/elixirc --ignore-module-conflict\" \
  >> /home/devel/.bash_aliases
