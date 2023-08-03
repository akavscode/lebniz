FROM alpine:latest

WORKDIR /app
COPY . .

RUN apk add --no-cache ca-certificates &&\
    chmod +x entrypoint.sh

CMD entrypoint.sh