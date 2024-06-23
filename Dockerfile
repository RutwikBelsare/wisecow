FROM golang:1.20-alpine AS builder

WORKDIR /app
COPY . .
RUN go build -o wisecow

FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/wisecow .
COPY ascii-art /app/ascii-art

EXPOSE 8080
CMD ["./wisecow"]