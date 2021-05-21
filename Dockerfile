FROM ruby:2.7.3

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN bundle install

EXPOSE 4000

CMD bundle exec jekyll help
