#!/usr/bin/env bash

function now() {
    echo "[$(date +"%x - %X")]"
}

function endscript() {
    echo "$(now) Stopping Postfix and exiting the container"
    postfix stop
    echo "$(now) Done"
    exit 0
}

echo "$(now) Starting Postfix Agent"
postfix -c /etc/postfix start && sleep 0.5 && echo "$(now) Postfix Agent started successfully"

trap endscript SIGINT
trap endscript SIGTERM

while true; do
    sleep 100 &
    wait $!
done
