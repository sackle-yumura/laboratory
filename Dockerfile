FROM ruby:3.2.2-alpine

ENV LANG C.UTF-8

ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD . $APP_ROOT

RUN apk update
RUN apk add --update --no-cache bash mariadb-connector-c-dev nodejs tzdata less xz-libs
RUN apk add --update --no-cache --virtual .build-dependencies build-base curl-dev gcc git g++ libxml2-dev libxslt-dev linux-headers make mariadb-dev ruby-dev yaml-dev zlib-dev
RUN bundle install -j4
RUN apk del .build-dependencies
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# ARG ASSETS_PRECOMPILE=true
# RUN if [ ${ASSETS_PRECOMPILE} = true ]; then \
#   SECRET_KEY_BASE=1 RAILS_ENV=production rake assets:precompile \
# ;fi

# VOLUME [ "/app/public", "/app/tmp" ]