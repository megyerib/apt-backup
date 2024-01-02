#!/usr/bin/env bash
set -eu

cd `dirname $0`

# Apt
apt list --installed | grep -v "^Listing...$" > list.txt
grep -oP "^[^/]+" list.txt > packets.txt
grep "\[installed\]" list.txt | grep -oP "^[^/]+" > manual.txt

# /etc/apt
rm -rf ./etc_apt
cp -r /etc/apt ./etc_apt

# Snap
snap list | sed -E "s/\s+/,/g" > snap.csv
