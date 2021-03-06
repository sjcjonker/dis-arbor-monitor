DOCKER_REGISTRY := community.cablelabs.com:4567
DOCKER_IMAGE_TAG := testing-queing
DOCKER_IMAGE_PATH := dis-docker/dis-arbor-monitor:$(DOCKER_IMAGE_TAG)
DOCKER_SAVE_FILE := dis-arbor-monitor-$(DOCKER_IMAGE_TAG)

docker-build:
	docker build -t $(DOCKER_REGISTRY)/$(DOCKER_IMAGE_PATH) .

docker-push:
	docker login $(DOCKER_REGISTRY)
	docker push $(DOCKER_REGISTRY)/$(DOCKER_IMAGE_PATH)

docker-save:
	docker save $(DOCKER_REGISTRY)/$(DOCKER_IMAGE_PATH) | gzip > $(DOCKER_SAVE_FILE).gz
