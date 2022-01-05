FROM "library/alpine:latest"

LABEL maintainer="Artur Mądrzak <artur@madrzak.eu>"

SHELL ["/bin/sh", "-o", "pipefail", "-c"]

# Install requirements to build image
# hadolint ignore=DL3008,DL3015
RUN apk add dante-server

COPY sockd.conf.in /usr/share
COPY setup.sh /usr/bin

ENTRYPOINT [ "setup.sh" ]

