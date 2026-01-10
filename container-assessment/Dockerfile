FROM golang:1.25.1-alpine

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

# Build main package inside internal/
RUN go build -o app ./internal/...

EXPOSE 8080

CMD ["./app"]
