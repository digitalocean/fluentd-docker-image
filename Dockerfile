FROM fluent/fluentd:v1.4.2-2.0@sha256:5ec85c9fea825f079f9141f37c454f54fcf9dce95e92e9cccd281ed928e3cf83

USER root

RUN apk add --no-cache --update --virtual .build-deps sudo build-base ruby-dev

RUN fluent-gem install fluent-plugin-out-http

RUN sudo gem sources --clear-all \
  && apk del .build-deps \
  && rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem
