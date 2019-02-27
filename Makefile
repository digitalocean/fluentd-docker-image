GIT_COMMIT := $(shell git rev-parse --short HEAD 2>/dev/null)
BASE_IMAGE_URL := digitalocean/fluentd
IMAGE_URL := $(BASE_IMAGE_URL):$(GIT_COMMIT)

docker-build:
	docker build --pull -t ${IMAGE_URL} .

docker-push: docker-build
	docker tag "${IMAGE_URL}" "${BASE_IMAGE_URL}:v1.3"
	docker tag "${IMAGE_URL}" "${BASE_IMAGE_URL}:latest"
	docker push "${IMAGE_URL}"
	docker push "${BASE_IMAGE_URL}:v1.3"
	docker push "${BASE_IMAGE_URL}:latest"
