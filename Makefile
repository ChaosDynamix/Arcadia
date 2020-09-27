SHELL = /bin/sh
DOCKER_IMAGE = githubpages:207

image:
	docker build --tag $(DOCKER_IMAGE) .

container:
	docker run --rm \
	--publish 4000:4000 \
	--volume="$(PWD):/srv/jekyll" \
	-it $(DOCKER_IMAGE) \
	bundle exec jekyll serve --host 0.0.0.0 --port 4000
