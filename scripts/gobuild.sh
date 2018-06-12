#!/bin/sh

dep ensure
CGO_ENABLED=0 GOOS=linux go build -v -a -installsuffix cgo -o ./main ./main.go
