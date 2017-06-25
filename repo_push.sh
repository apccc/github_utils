#!/bin/bash
REPOSITORY=`echo "$1" | grep -oe '[a-zA-Z0-9_.-]*'`
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

echo "Adding:"
git add .
echo "Committing:"
git commit -m "Commit"
echo "Pushing:"
git push --force

~/github_utils/sshAgent_kill.sh
exit 0
