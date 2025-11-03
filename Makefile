BIN_DIR=bin
BUILD_DIR=build
APP_NAME=url-shortener

.PHONY: build
build:
	@mkdir -p $(BIN_DIR)
	go build -v -o $(BIN_DIR)/$(APP_NAME) ./cmd/url-shortener

.PHONY: run
run: build
	./$(BIN_DIR)/$(APP_NAME)

.PHONY: test
test:
	go test -v -race -timeout 30s ./...

.PHONY: clean
clean:
	rm -rf $(BIN_DIR) $(BUILD_DIR) storage/*.db

.PHONY: install-deps
install-deps:
	go mod download
	go mod verify

.PHONY: build-linux
build-linux:
	@mkdir -p $(BUILD_DIR)
	GOOS=linux GOARCH=amd64 go build -v -o $(BUILD_DIR)/$(APP_NAME)-linux ./cmd/url-shortener

.PHONY: build-windows
build-windows:
	@mkdir -p $(BUILD_DIR)
	GOOS=windows GOARCH=amd64 go build -v -o $(BUILD_DIR)/$(APP_NAME).exe ./cmd/url-shortener

.PHONY: build-darwin
build-darwin:
	@mkdir -p $(BUILD_DIR)
	GOOS=darwin GOARCH=amd64 go build -v -o $(BUILD_DIR)/$(APP_NAME)-macos ./cmd/url-shortener

.PHONY: build-all
build-all: build-linux build-windows build-darwin

.PHONY: generate
generate:
	go generate ./...

.DEFAULT_GOAL := build