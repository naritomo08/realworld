FROM hexpm/elixir:1.13.1-erlang-24.2.1-debian-bullseye-20210902-slim

RUN apt-get update && \
    apt-get install --yes build-essential inotify-tools postgresql-client git && \
    apt-get clean

RUN mix local.hex --force && \
  mix archive.install hex phx_new --force && \
  mix local.rebar --force

ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID devel
RUN useradd -u $UID -g devel -m devel
RUN echo "devel ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY --chown=devel:devel ./apps /apps

USER devel
