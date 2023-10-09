# Dockerfile
FROM golang:1.18-alpine as builder

RUN apk add --update --no-cache ca-certificates git && \
    apk add vim && \
    apk add --no-cache gcc && \
    apk add --no-cache musl-dev

ENV ROOT=/go/src/webapp/go
COPY . ${ROOT}
WORKDIR ${ROOT}

RUN GOOS=linux \
    GOARCH=amd64 \
    go build -v -mod=readonly ./src/torb

FROM alpine as dev
ENV ROOT=/go/src/webapp/go
COPY --from=builder /go/src/webapp/go /go/src/webapp/go
WORKDIR ${ROOT}

CMD ["./torb"]
