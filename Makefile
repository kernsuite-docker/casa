VERSION := 5.1.2-4
DOCKER_REPO := kernsuite/casa:$(VERSION)


.PHONY: build clean run upload download


all: build run upload


download:
	./download.sh $(VERSION)


build: download
	docker build --build-arg VERSION=$(VERSION) -t ${DOCKER_REPO} .


clean:
	docker rmi ${DOCKER_REPO}


run:
	docker run -ti ${DOCKER_REPO}


upload: build
	docker push ${DOCKER_REPO}
