#!/bin/bash
#make a file executable
if [ -z "$1" ];then
  echo "File not set"
  exit 1
fi
F=$1
if [ ! -f "$F" ];then
  echo "$F is not a file!"
  exit 1
fi
git update-index --chmod=+x "$F"
chmod 755 "$F"
git commit --amend -m "Making file executable."
exit 0
