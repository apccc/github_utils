#!/bin/bash
if [[ `which git | wc -l` -lt 1 ]];then
  sudo apt-get -qq update
  sudo apt-get -qq -y install git
fi
