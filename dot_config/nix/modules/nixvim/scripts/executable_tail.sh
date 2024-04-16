#!/usr/bin/env bash

echo $0

cd $(dirname $0)
tail -f ../build.log | spacer
