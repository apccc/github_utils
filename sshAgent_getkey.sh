#!/bin/bash
K=`echo "$1" | grep -oe '[a-zA-Z0-9_.-]*'`
F=~/github_keys/"$K"_key
if [ ! -f "$F" ];then
  exit 1
fi
echo "$F"
exit 0
