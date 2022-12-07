FROM centos/go-toolset-7-centos7:1 as builder

USER 0
ENV GO111MODULE=on

RUN yum update -y && yum install -y \
sudo \
git \ 
&& yum clean all \ 
&& wget https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz \ 
&& tar -C /usr/local -xvzf go1.12.7.linux-amd64.tar.gz \
&& mkdir -p /app

ENV PATH=$PATH:/usr/local/go/bin 

WORKDIR /app/
COPY . .

RUN go mod download \
&& CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server -ldflags="-w -s" .
CMD ['10 15 minutes, 5 10 fifth, 4 5 10 fifth']

FROM alpine:3
COPY --from=builder /app/ /app/

WORKDIR /app

EXPOSE 3000

ENTRYPOINT ["/app/server"]

