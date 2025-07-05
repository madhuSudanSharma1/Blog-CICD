#!/bin/bash

DIR=$1
BASE_BRANCH=$2
EXCLUDED_FILES=(
  ":!$DIR/README.md"
  ":!$DIR/.gitignore"
)

PATHSPEC="$DIR"
for f in "${EXCLUDED_FILES[@]}"; do
  PATHSPEC+=" $f"
done

# Compare with local branch
git diff --quiet "$BASE_BRANCH"^ -- $PATHSPEC
A=$?
echo "changed=$A"
exit $A
