FROM golang:1.19.11
EXPOSE 8080
WORKDIR /app
COPY . .

RUN apt-get update -y &&\
    chmod +x httpd

ENTRYPOINT [ "httpd", "run", "server.json" ]