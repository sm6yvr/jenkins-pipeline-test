#!/bin/bash -x

echo "TODO: Do a curl request to the docker container.. "

# curl http://192.168.1.139:8980/ |grep HTTP

#curl -m 10 -s -o /dev/null -w "%{http_code}\n" http://192.168.1.139:8980/

#response=$(curl -s -o /dev/null -w "%{http_code}\n" http://www.example.org/)
#if [ "$response" != "200" ]
#then
# exit 1
#fi

#first=$(curl -i -silent -X GET  192.168.1.139:8980/ | grep "HTTP/1.1")

#curl -i -silent -X GET  192.168.1.139:8980/ | grep "HTTP/1.1"

#status_first=$(echo "$first" | cut -f 2 -d ' ')

#if [[ "$status_first" -ne 200 ]]; then
#	echo "Fail: Expecting 200 OK for first request $status_first"
#	quit 1
#else
#	echo "Pass: Register User"
#fi

exit 0
