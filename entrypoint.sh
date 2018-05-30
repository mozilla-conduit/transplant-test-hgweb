#!/bin/sh
set -e
case "$1" in
    "start")
        /init-repos.sh
        echo 'starting httpd'
        exec httpd -DFOREGROUND
        ;;
    *)
        exec $*
        ;;
esac
