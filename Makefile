IMAGE ?= lxfontes/kaniko-resource
VERSION ?= $(shell git rev-parse --short HEAD)

all: test

test:
	echo bla

release: image-build image-push

image-push:
	docker push $(IMAGE):$(VERSION)

image-build:
	docker build . -t $(IMAGE):$(VERSION) -t $(IMAGE):latest

.PHONY: all test release image-push image-build
