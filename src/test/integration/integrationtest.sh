#!/bin/bash

first=$(curl -i -silent -X GET  192.168.1.139:8980/ | grep "HTTP/1.1")

curl -i -silent -X GET  192.168.1.139:8980/ | grep "HTTP/1.1"

status_first=$(echo "$first" | cut -f 2 -d ' ')

if [[ "$status_first" -ne 200 ]]; then
	echo "Fail: Expecting 200 OK for first request $status_first"
	quit 1
else
	echo "Pass: Register User"
fi

quit 0
