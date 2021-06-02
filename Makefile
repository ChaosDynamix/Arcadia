SHEll = /bin/sh

# Local variables
LOCAL_DIR = $(shell pwd)
LOCAL_PORT = 8000

# Docker variables
DOCKER_DIR = /docs
DOCKER_PORT = 8000
DOCKER_IMG = squidfunk/mkdocs-material

# Commands are recipes
.PHONY: server website

# Start the development server
server:
	docker run --rm -it
	           --publish $(LOCAL_PORT):$(DOCKER_PORT)
	           --volume $(LOCAL_DIR):$(DOCKER_DIR)
	           $(DOCKER_IMG)

# Build the website in the `site` directory
website:
	docker run --rm -it
	           --volume $(LOCAL_DIR):$(DOCKER_DIR)
		       $(DOCKER_IMG)
	           build
