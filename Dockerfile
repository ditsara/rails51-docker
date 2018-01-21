FROM ruby:2.3
MAINTAINER Dan Itsara <dan@glazziq.com>

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qq && apt-get install -y build-essential imagemagick libpq-dev nodejs yarn

ENV app /app
RUN mkdir $app
WORKDIR $app
ENV BUNDLE_PATH $app/bundles
