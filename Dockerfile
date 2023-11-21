FROM golang:1.21 as builder
WORKDIR /
RUN addgroup -g 1001 app
RUN adduser app -u 1001 -D -G app /home/app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -mod=vendor -o ./hallo-welt main.go
USER app
ENTRYPOINT ["/hallo-welt"]