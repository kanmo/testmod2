# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOFLAGS=-ldflags="-s -w"
BINARY_NAME=testmod2

# Docker parameters
DOCKER=docker
DOCKER_IMAGE=testmod2-image
DOCKER_TAG=latest


# Make tasks
.PHONY: all build clean run dockerimage

all: build

build:
	$(GOBUILD) $(GOFLAGS) -o $(BINARY_NAME) -v

clean:
	$(GOCLEAN)
	rm -f $(BINARY_NAME)

run: build
	./$(BINARY_NAME)

dockerimage: build
	$(DOCKER) build -t $(DOCKER_IMAGE):$(DOCKER_TAG) .
