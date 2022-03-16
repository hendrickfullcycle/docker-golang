FROM golang:1.16-alpine as builder

WORKDIR /app
COPY go.mod ./
RUN go mod download
COPY *.go ./
RUN go build -o /docker-golang
CMD [ "/docker-golang" ]

FROM scratch
WORKDIR /
COPY --from=builder /docker-golang /docker-golang
ENTRYPOINT ["/docker-golang"]