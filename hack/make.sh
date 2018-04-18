#!/bin/sh

go get -v -d
CGO_ENABLED=0 GOOS=linux go build -v -a -ldflags '-extldflags "-static"'
