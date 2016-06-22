FROM golang:latest
MAINTAINER dre@designet.com

RUN go get -u github.com/mattes/migrate

COPY migrations/ /migrations/
VOLUME /migrations

ENV DRIVER=postgres USER=postgres HOST=localhost PORT=5432 DBNAME=postgres DRIVER_ARGS="sslmode=disable"

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["help"]
