FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o wfm ./cmd/api

FROM alpine:3.19
WORKDIR /srv
COPY --from=builder /app/wfm .
EXPOSE 8080
ENV PORT=8080
CMD ["./wfm"]
