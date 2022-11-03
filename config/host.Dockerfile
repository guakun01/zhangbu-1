FROM ruby:3.0.0

ENV RAILS_ENV production
RUN mkdir /zhangbu
RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.com
WORKDIR /zhangbu
ADD zhangbu-*.tar.gz ./
RUN bundle config set --local without 'development test'
RUN bundle install --local
ENTRYPOINT bundle exec puma