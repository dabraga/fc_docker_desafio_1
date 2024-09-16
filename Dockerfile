# Iniciando uma imagem base golang:alpine
FROM golang:alpine AS builder
WORKDIR /prj/go
COPY desafio_go.go .
RUN go build -ldflags '-s -w' desafio_go.go

FROM scratch
WORKDIR /
COPY --from=builder /prj/go .
CMD ["./desafio_go"]

