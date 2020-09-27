FROM ruby:alpine

# Github-pages version
ENV GH_PAGES=207

# Update Ruby Gem
RUN gem update --system --no-document

# Install build dependencies
RUN apk add --no-cache build-base

# Install Github-pages
RUN gem install github-pages -v $GH_PAGES --no-document

# Delete build dependencies
RUN apk del --no-cache build-base

# Workdir
WORKDIR /srv/jekyll

# Port
EXPOSE 4000

# Run Jekyll help
CMD ["jekyll", "--help"]
