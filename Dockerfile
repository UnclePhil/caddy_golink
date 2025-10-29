FROM caddy:alpine

RUN apk add --no-cache curl grep coreutils
WORKDIR /app
RUN curl -fsSL https://github.com/bluebrown/go-template-cli/releases/latest/download/tpl-linux-amd64 >tpl && \
    chmod 755 tpl

COPY ./app /app

VOLUME [ "/app/config" ]

ENTRYPOINT ["/app/entrypoint.sh"]