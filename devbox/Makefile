# Makefile

# Config
IMAGE_NAME = devbox
CONTAINER_NAME = devbox
DOCKERFILE = Dockerfile
WORKDIR = /home/devbox

# Default target
.PHONY: all
all: build run

# Build the Docker image
.PHONY: build
build:
	docker build -t $(IMAGE_NAME) -f $(DOCKERFILE) .

# Run container interactively
.PHONY: run
run:
	docker run -it --rm \
		--hostname "uedwiak" \
		--name $(CONTAINER_NAME) \
		-v $(PWD)/work:$(WORKDIR)/work \
		-w $(WORKDIR) \
		$(IMAGE_NAME) /bin/zsh

# Run exec
.PHONY: exec
exec:
	docker exec -it $(CONTAINER_NAME) /bin/zsh


# Start container in background (for long-running use)
.PHONY: start
start:
	docker run -d \
		--name $(CONTAINER_NAME) \
		-v $(PWD):$(WORKDIR) \
		-w $(WORKDIR) \
		$(IMAGE_NAME) tail -f /dev/null

# Stop background container
.PHONY: stop
stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

# Clean image
.PHONY: clean
clean:
	docker rmi $(IMAGE_NAME) || true

