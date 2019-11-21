FROM fluent/fluentd:v1.7.4-1.0@sha256:2161f4c5f1989770155074b37d7bb6d071fb726f4aee361c4bb2e5ba529ae89b

USER root

RUN apk add --no-cache --update --virtual .build-deps sudo build-base ruby-dev

RUN fluent-gem install fluent-plugin-out-http

RUN sudo gem sources --clear-all \
  && apk del .build-deps \
  && rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem
