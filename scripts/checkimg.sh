#!/bin/sh
set -eu
emptyimgs=$(find public/ogimage -type f -size 0)
if test -n "$emptyimgs"; then
    echo "ERROR: empty images found"
    echo "$emptyimgs"
    exit 1
fi
echo "OK: no empty images found"
