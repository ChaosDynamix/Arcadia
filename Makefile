SHELL = /bin/sh
JEKYLL_VERSION = 3.8.5

serve:
	docker run --rm \
	--publish 4000:4000 \
	--volume="$(PWD):/srv/jekyll" \
	--volume="$(PWD)/vendor/bundle:/usr/local/bundle" \
	-it jekyll/jekyll:$(JEKYLL_VERSION) \
	jekyll serve

build:
	docker run --rm \
	--volume="$(PWD):/srv/jekyll" \
	--volume="$(PWD)/vendor/bundle:/usr/local/bundle" \
	-it jekyll/jekyll:$(JEKYLL_VERSION) \
	jekyll build
