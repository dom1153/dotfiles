#!/usr/bin/env bash

cd $(dirname $0)
tail -f ../build.log | spacer
