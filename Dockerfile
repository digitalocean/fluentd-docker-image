FROM fluent/fluentd:v1.7.3-1.0@sha256:135e15531d9180c128196f1890af591362185c8cb1146858512eeabf244aba6e

USER root

RUN apk add --no-cache --update --virtual .build-deps sudo build-base ruby-dev

RUN fluent-gem install fluent-plugin-out-http

RUN sudo gem sources --clear-all \
  && apk del .build-deps \
  && rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem
