#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
pushd $SCRIPT_DIR
if ! git diff --quiet || ! git diff --cached --quiet || [ -n "$(git ls-files --others --exclude-standard)" ]; then
  echo "Local changes exist"
  git add --all
  git commit -m "Saving new songs"
  git pull --rebase
  git push origin master
else
  echo "Working tree clean"
  git pull --rebase
fi
popd
