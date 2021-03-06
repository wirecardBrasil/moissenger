FROM ruby:2.3.3-slim

ARG BUNDLE_ARGS="--without development test"

RUN mkdir /moissenger
COPY Gemfile /moissenger/Gemfile
COPY Gemfile.lock /moissenger/Gemfile.lock
WORKDIR /moissenger

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libsqlite3-dev && bundle install --jobs=4 --retry=3 $BUNDLE_ARGS

COPY . /moissenger

EXPOSE 3000

ENTRYPOINT [bin/entrypoint]