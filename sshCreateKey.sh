#!/bin/bash
K=`echo "$1" | grep -oe '[a-zA-Z0-9_.-]*'`
U=$2
F=~/github_keys/"$K"_key
ssh-keygen -t rsa -f $F -C $U
if [ ! -f "$F" ];then
  echo "Key Not Created!"
  exit 1
fi
echo "Key Created: $F"
exit 0
