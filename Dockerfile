FROM alpine

LABEL maintainer "F11snipe <f11snipe@gmail.com>"

ENV MAJOR_VER '3.15'

RUN apk add --no-cache \
  ca-certificates curl \
  gcc bash curl make perl \
  python3-dev libffi-dev openssl-dev pcre-dev zlib-dev

RUN curl -s http://openresty.org/package/admin@openresty.com-5ea678a6.rsa.pub -o /etc/apk/keys/admin@openresty.com-5ea678a6.rsa.pub
RUN echo "http://openresty.org/package/alpine/v$MAJOR_VER/main" | tee -a /etc/apk/repositories
RUN apk update && apk add openresty openresty-resty

CMD [ "/usr/local/openresty/nginx/sbin/nginx", "-g", "daemon off;" ]

# CMD [ "ls" ]

