FROM ruby:3.0.0

ENV RAILS_ENV production
RUN mkdir /zhangbu
RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.com
WORKDIR /zhangbu
ADD Gemfile /zhangbu
ADD Gemfile.lock /zhangbu
ADD vendor/cache /zhangbu/vendor/cache
RUN bundle config set --local without 'development test'
RUN bundle install --local
ADD zhangbu-*.tar.gz ./
ENTRYPOINT bundle exec puma