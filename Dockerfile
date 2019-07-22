FROM fluent/fluentd:v1.6.2-1.0@sha256:17e3e8a268fda02a417addc542bbe60f81834aeb15d12e85d68425def3063892

USER root

RUN apk add --no-cache --update --virtual .build-deps sudo build-base ruby-dev

RUN fluent-gem install fluent-plugin-out-http

RUN sudo gem sources --clear-all \
  && apk del .build-deps \
  && rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem
