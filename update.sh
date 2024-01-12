#!/usr/bin/env bash
set -eu

cd `dirname $0`

# Config
cfg=apt-backup.cfg
if [[ ! -f $cfg ]]; then
    echo "dir=backup" > $cfg
fi
source $cfg

# Backup dir
mkdir -p $dir
cd $dir

# Apt
apt list --installed 2>/dev/null | grep -v "^Listing...$" > list.txt
grep -oP "^[^/]+" list.txt > packets.txt
apt list --manual-installed 2>/dev/null | grep -v "^Listing...$" | grep -oP "^[^/]+" > manual.txt

# /etc/apt
rm -rf ./etc_apt
cp -r /etc/apt ./etc_apt

# Snap
snap list | sed -E "s/\s+/,/g" > snap.csv
