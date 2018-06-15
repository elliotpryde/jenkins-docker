#!/bin/bash -eu

http_code=$(curl -s -o /dev/null -w "%{http_code}" localhost:8080)

if [ $http_code -eq 403 ]; then
  exit 0
fi

exit 1
