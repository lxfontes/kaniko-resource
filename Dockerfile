FROM golang:1.10 AS builder
RUN go get github.com/GoogleContainerTools/kaniko/cmd/executor

FROM ubuntu:xenial
COPY --from=builder /go/bin/executor /usr/bin/executor

RUN apt-get update && \
    apt-get install -y \
    ca-certificates \
    jq \
    && \
    apt-get clean

COPY rootfs /
