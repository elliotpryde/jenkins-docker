#!/bin/bash -eu

http_code=$(curl localhost:8080 -fsw %{http_code} -o /dev/null)

if [ $http_code -eq 403 ]; then
  exit 0
fi

exit 1
