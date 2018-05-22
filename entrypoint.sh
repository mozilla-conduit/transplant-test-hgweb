#!/bin/sh
set -e
case "$1" in
    "start")
        echo 'starting httpd'
        exec httpd -DFOREGROUND
        ;;
    *)
        exec $*
        ;;
esac
