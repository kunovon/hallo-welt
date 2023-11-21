#FROM alpine:3.15 as root-certs
FROM alpine:3.18.4 as root-certs
RUN apk add -U --no-cache ca-certificates
RUN addgroup -g 1001 app
RUN adduser app -u 1001 -D -G app /home/app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -mod=vendor -o ./hallo-welt main.go
USER app
ENTRYPOINT ["/hallo-welt"]