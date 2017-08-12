#!/bin/bash

#get the current repository, based on the directory the user is in

if [ ! -d "$PWD/.git" ];then
  exit;
fi

echo ${PWD##*/}
