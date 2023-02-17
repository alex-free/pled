#!/bin/bash

ver=1.0.2
set -e

cd "$(dirname "$0")"
rm -rf pled-$ver*

if [ "$1" == "--clean" ]; then
    exit 0
fi

mkdir pled-$ver
cp -r pled readme.md images unlicense.txt pled-$ver
chmod -R 777 pled-$ver
zip -r pled-$ver.zip pled-$ver