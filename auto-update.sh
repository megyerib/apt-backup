#!/usr/bin/env bash
set -eu

cd `dirname $0`
./update.sh
git add .
git commit -m "Auto update: `date`"

