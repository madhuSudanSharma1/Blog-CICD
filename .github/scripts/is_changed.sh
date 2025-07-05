#!/bin/bash

DIR=$1
EXCLUDED_FILES=(
  ":!$DIR/README.md"
  ":!$DIR/.gitignore"
)

PATHSPEC="$DIR"
for f in "${EXCLUDED_FILES[@]}"; do
  PATHSPEC+=" $f"
done

git diff --quiet "$BASE_BRANCH"^ -- $PATHSPEC
A=$?
echo "changed=$A"
exit $A

