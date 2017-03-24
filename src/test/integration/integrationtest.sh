#!/bin/bash

function quit {
	docker-compose stop
	docker-compose rm -f
	exit $1
}

docker-compose --verbose up -d


# Make sure containers are ready for the test
echo "Waiting for container to start"
sleep 20

first=$(curl -i -silent -X GET  192.168.1.139:8980/ | grep "HTTP/1.1")

status_first=$(echo "$first" | cut -f 2 -d ' ')

if [[ "$status_first" -ne 200 ]]; then
	echo "Fail: Expecting 200 OK for first request $status_first"
	quit 1
else
	echo "Pass: Register User"
fi

quit 0
