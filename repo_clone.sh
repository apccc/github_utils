#!/bin/bash
ORGANIZATION=`echo "$1" | grep -oe '[a-zA-Z0-9_.-]*'`
REPOSITORY=`echo "$2" | grep -oe '[a-zA-Z0-9_.-]*'`
if [ -z "$ORGANIZATION" ];then
  echo "Organization Not Set!"
  exit 0
fi
if [ -z "$REPOSITORY" ];then
  echo "Repository Not Set!"
  exit 0
fi

F=`~/github_utils/sshAgent_getkey.sh "$REPOSITORY"`
if [ ! -f "$F" ];then
  echo "Key Not Found : $F!"
  exit 1
fi
eval "$(ssh-agent -s)" > /dev/null 2>&1
ssh-add $F

~/github_utils/install_git.sh
S=git@github.com:${ORGANIZATION}/${REPOSITORY}.git
echo "Cloning ${S}"
git clone ${S}
if [ -d "${REPOSITORY}" ];then
  cd ${REPOSITORY}
  if [ -z "$(git config --list | grep user.name | cut -d'=' -f2)" ];then
    git config user.name "$(whoami)"
  fi
fi
~/github_utils/sshAgent_kill.sh
exit 0
