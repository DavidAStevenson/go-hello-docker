FROM golang as builder
ENV GO_SRC_DIR=/go/src
COPY . ${GO_SRC_DIR}
WORKDIR ${GO_SRC_DIR}
RUN go build -o $GOPATH/bin/hello hello.go 
# ENTRYPOINT $GOPATH/bin/hello

# FROM alpine:latest
# COPY --from=builder /go/bin/hello /hello
# CMD ["./hello"]

FROM scratch
COPY --from=builder /go/bin/hello /hello
ENTRYPOINT ["/hello"]

