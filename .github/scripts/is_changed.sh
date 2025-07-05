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

if git diff --quiet HEAD^ HEAD -- $PATHSPEC; then
  echo "changed=false" >> $GITHUB_OUTPUT
else
  echo "changed=true" >> $GITHUB_OUTPUT
fi