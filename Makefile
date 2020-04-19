SHELL = /bin/sh
JEKYLL_VERSION = 3.8.5

serve:
	sudo docker run --rm \
	--publish 4000:4000 \
	--volume="$(PWD):/srv/jekyll" \
	--volume="$(PWD)/vendor/bundle:/usr/local/bundle" \
	-it jekyll/jekyll:$(JEKYLL_VERSION) \
	jekyll serve

build:
	sudo docker run --rm \
	--volume="$(PWD):/srv/jekyll" \
	--volume="$(PWD)/vendor/bundle:/usr/local/bundle" \
	-it jekyll/jekyll:$(JEKYLL_VERSION) \
	jekyll build
