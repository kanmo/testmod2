# Use the official golang image as a base image
FROM golang:1.19-alpine AS builder

# Set the working directory
WORKDIR /app

# Copy source files
COPY . .

# Build the Go app
RUN go build -o testmod2

# Use the alpine image as a base image
FROM alpine

# Set the working directory
WORKDIR /app

# Copy the binary from the builder stage
COPY --from=builder /app/testmod2 /app/

# Expose the application port
EXPOSE 8080

# Run the application
CMD ["./testmod2"]
