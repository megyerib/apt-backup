#!/usr/bin/env bash
set -eu

cd `dirname $0`

apt list --installed | grep -v "^Listing...$" > list.txt
grep -oP "^[^/]+" list.txt > packets.txt
