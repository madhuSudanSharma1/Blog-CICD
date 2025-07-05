#!/bin/bash

DIR=$1
BASE_BRANCH=$2
EXCLUDED_FILES=(
  ":!$DIR/README.md"
  ":!$DIR/.gitignore"
  ":!.release-it.json"
)

PATHSPEC="$DIR"
for f in "${EXCLUDED_FILES[@]}"; do
  PATHSPEC+=" $f"
done


git diff --quiet HEAD^ -- $PATHSPEC
A=$?
echo $A
exit $A


git diff --quiet "$BASE_BRANCH" -- $PATHSPEC
A=$?
echo $A
exit $A
