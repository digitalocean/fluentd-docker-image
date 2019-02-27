FROM fluent/fluentd:v1.3

RUN apk add --no-cache --update --virtual .build-deps sudo build-base ruby-dev

RUN fluent-gem install fluent-plugin-out-http

RUN sudo gem sources --clear-all \
  && apk del .build-deps \
  && rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem
