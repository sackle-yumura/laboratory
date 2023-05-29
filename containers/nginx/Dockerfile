FROM nginx:alpine

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash

# Remove the default conf
RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf.template /etc/nginx