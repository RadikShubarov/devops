FROM centos/go-toolset-7-centos7:1 as builder

USER 0
ENV GO111MODULE=on

WORKDIR /app/
COPY . .

RUN go mod download \
&& CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server -ldflags="-w -s" .


FROM alpine:3

COPY --from=builder /app/ /app/

WORKDIR /app

EXPOSE 3000

ENTRYPOINT ["/app/server"]

