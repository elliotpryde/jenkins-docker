#!/bin/sh

openssl genrsa \
  -aes256 \
  -out ca-key.pem 4096
