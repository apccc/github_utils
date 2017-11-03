#!/bin/bash
#Create SSH Key for GitHub Repository

if [ -z "$1" ];then
  echo "Error: Repository Name Not Provided!"
  exit 1
fi
K=`echo "$1" | grep -oe '[a-zA-Z0-9_.-]*'`

if [ -z "$2" ];then
  echo "Error: User Name Not Provided!"
  exit 1
fi
U=$2

D=~/github_keys
F="${D}/${K}"_key
if [ ! -d "$D" ];then
  echo "Creating Directory: $D"
  mkdir -p "$D"
fi
ssh-keygen -t rsa -f $F -C $U
if [ ! -f "$F" ];then
  echo "Key Not Created!"
  exit 1
fi
echo "Key Created: $F"
P="${F}.pub"
if [ -f "$P" ];then
  echo "Public file $P :"
  cat $P
fi
exit 0
