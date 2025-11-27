FROM demisto/unzip:1.0.0.4855875 as zipper
RUN curl -fsSL https://github.com/Andrew4d3/go-csv2json/releases/download/v1.0/csv2json.zip >csv2json.zip 
RUN unzip csv2json.zip 

FROM caddy:alpine
RUN apk add --no-cache curl grep coreutils
WORKDIR /app
COPY --from=zipper csv2json csv2json
RUN curl -fsSL https://github.com/bluebrown/go-template-cli/releases/latest/download/tpl-linux-amd64 >tpl && \
    chmod 755 *


COPY ./app /app
RUN chmod 755 /app/entrypoint.sh

VOLUME [ "/app/config" ]

ENTRYPOINT ["/app/entrypoint.sh"]