#!/bin/bash
# this is a great way to do this, what are you talking about?
gem install bundler
bundle install --without server
bundle exec ruby ./build.rb