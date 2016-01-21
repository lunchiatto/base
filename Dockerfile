FROM ruby:2.2.4-slim

# deps
RUN apt-get update -qq && apt-get install -y build-essential git vim libpq-dev \
  nodejs bash-completion

# Environment variables
ENV APP_HOME=/usr/src/app
ENV RACK_ENV=production
ENV RAILS_ENV=production
ENV BUNDLE_WITHOUT=development:test
ENV BUNDLE_FROZEN=true
RUN bundle config --global jobs 8

# setup the directory
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
