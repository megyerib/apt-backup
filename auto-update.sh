#!/usr/bin/env bash
set -eu

cd `dirname $0`
./update.sh

source apt-backup.cfg
cd $dir

if [[ ! -d .git ]]; then
    git init
fi

if [[ ! -f .gitignore ]]; then
    echo "*.gpg" > .gitignore
    echo "*.gpg~" >> .gitignore
fi

git add .
git commit -m "Auto update: `date`"

