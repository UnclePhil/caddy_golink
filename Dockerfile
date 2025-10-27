FROM caddy:alpine

WORKDIR /app
COPY ./app /app

VOLUME [ "/app/config" ]

CMD ["/app/entrypoint.sh"]