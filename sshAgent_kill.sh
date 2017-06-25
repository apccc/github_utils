#!/bin/bash

APID=`ps -ea | grep ssh-agent | sed 's/^\s*//' | cut -d' ' -f1 | head -n 1`
if [[ $APID -gt 0 ]];then
  echo "ID: $APID"
  kill -9 "$APID"
fi
exit 0
