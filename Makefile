IMAGE ?= lxfontes/kaniko-resource
VERSION ?= $(shell git rev-parse --short)

all: test

test:
	echo bla

release: image-build image-push

image-push:
	docker tag $(IMAGE):$(VERSION) -t $(IMAGE):latest
	docker push $(IMAGE):$(VERSION)

image-build:
	docker build . -t $(NAME):$(VERSION)

.PHONY: all test release image-push image-build
