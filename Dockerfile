FROM alpine:latest

WORKDIR /app
COPY . .

RUN apk add --no-cache ca-certificates &&\
    chmod +x /app/entrypoint.sh

CMD /app/entrypoint.sh