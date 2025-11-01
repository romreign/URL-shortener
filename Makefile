.PHONY: build
build:
	go build -v ./cmd/url-shortener/main.go

DEFAULT_GOAL: build