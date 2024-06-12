#!/bin/bash
if [ "$1" == "" ]
then
    echo "FUZZ!"
    echo "how to use the fuzz program?"
    echo "first you need to pass a host!"
else
    var1=$(curl -s "$1" | grep -oP 'href="http[^"]*' | cut -d "/" -f 3)
    for domain in $var1; do
        host $domain | grep "has address" | cut -d " " -f 4
    done
fi
