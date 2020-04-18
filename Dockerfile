FROM jekyll/jekyll:3.8.5
COPY Gemfile /srv/jekyll/
WORKDIR /srv/jekyll
RUN bundle install
CMD ["jekyll","serve"]
