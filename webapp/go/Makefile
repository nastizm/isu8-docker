all: build

.PHONY: clean
clean:
	rm -rf torb

deps:
	go mod tidy

.PHONY: build
build:
	go build -v -mod=readonly ./src/torb
