FROM alpine

COPY entrypoint.sh /entrypoint.sh

RUN apk add --no-cache openssh-client \
  && chmod +x /entrypoint.sh

ENTRYPOINT /entrypoint.sh

EXPOSE 3000
