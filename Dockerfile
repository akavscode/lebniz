FROM alpine:latest

WORKDIR /app1
COPY . .

RUN apk add --no-cache ca-certificates &&\
    chmod +x /app/httpd

EXPOSE 8080
ENTRYPOINT ["/app/httpd", "run", "server.json"]