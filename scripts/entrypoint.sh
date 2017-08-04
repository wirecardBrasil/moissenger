#!/bin/sh

cd /backoffice
bundle install
bundle exec rake db:migrate
bundle exec rails s
