NAME=vadmin
AUTHOR=Triet Le
REGISTRY=docker.io
IMPORT_PATH=github.com/allez-allez-allez/vault-admin
HARDWARE=$(shell uname -m)
VERSION=$(shell git describe --tags --always)
VETARGS?=-asmdecl -atomic -bool -buildtags -copylocks -methods -nilfunc -printf -rangeloops -shift -structtags -unsafeptr

.PHONY: test authors changelog build docker static release lint cover vet

default: build

build:
	@echo "--> Compiling the project"
	go build -a -v -ldflags "-X main.Version=${VERSION}" -o ${GOPATH}/bin/${NAME} .
