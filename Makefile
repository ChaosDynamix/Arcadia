SHELL = /bin/sh

LOCAL_PORT = 4000
LOCAL_DIR = $(shell pwd)
DOCKER_HOST = 0.0.0.0
DOCKER_PORT = 4000
DOCKER_DIR = /usr/src/app
DOCKER_IMG_RUBY = ruby:2.7.3
DOCKER_IMG_GHPAGES = gh-pages:214

# Launch command as recipes
.PHONY: gemfile_lock image container

# Generate Ruby Gemfile.lock
gemfile_lock:
	docker run --rm \
               --volume $(LOCAL_DIR):$(DOCKER_DIR) \
               --workdir $(DOCKER_DIR) \
               $(DOCKER_IMG_RUBY) \
               bundle install

# Build Docker image
image:
	docker build --tag $(DOCKER_IMG_GHPAGES) .

# Start Docker container
container:
	docker run --rm \
               --volume $(LOCAL_DIR):$(DOCKER_DIR) \
               --publish $(LOCAL_PORT):$(DOCKER_PORT) \
               $(DOCKER_IMG_GHPAGES) \
               bundle exec jekyll serve --host $(DOCKER_HOST) --port $(DOCKER_PORT)
