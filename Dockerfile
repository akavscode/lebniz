FROM alpine:latest

WORKDIR /app1
COPY . .

RUN apk add --no-cache ca-certificates &&\
    chmod +x /app1/entrypoint.sh

CMD /entrypoint.sh