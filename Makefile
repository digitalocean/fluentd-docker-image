NAME := fluentd
DOCKER_ORG := digitalocean
GIT_COMMIT := $(shell git rev-parse --short HEAD 2>/dev/null)

BASE_IMAGE_URL := $(DOCKER_ORG)/$(NAME)
IMAGE_URL := $(BASE_IMAGE_URL):$(GIT_COMMIT)

docker-build:
	docker build --pull -t ${IMAGE_URL} .

docker-push: docker-build
	docker push "${IMAGE_URL}"

