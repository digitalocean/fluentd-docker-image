FROM fluent/fluentd:v1.5.1-1.0@sha256:31a2e95c5c70f2eb946ce6e6158f86a7663ce4e6062e761f389ec085046174c2

USER root

RUN apk add --no-cache --update --virtual .build-deps sudo build-base ruby-dev

RUN fluent-gem install fluent-plugin-out-http

RUN sudo gem sources --clear-all \
  && apk del .build-deps \
  && rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem
