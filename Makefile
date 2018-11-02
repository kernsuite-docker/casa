VERSION := kern-dev
DOCKER_REPO := kernsuite/casa:$(VERSION)


.PHONY: build clean run upload download


all: build run upload


build: download
	docker build -t ${DOCKER_REPO} .


run:
	docker run -ti ${DOCKER_REPO}

