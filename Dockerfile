# syntax = docker/dockerfile:1.1-experimental

FROM golang:1.13
RUN git clone -b master git://github.com/influxdata/influxdb /buildroot
WORKDIR /buildroot
RUN \
    --mount=type=cache,id=go-build,target=/root/.cache/go-build \
    --mount=type=cache,id=go-mod,target=/go/pkg/mod \
    go build -trimpath -o /usr/local/bin ./cmd/...
