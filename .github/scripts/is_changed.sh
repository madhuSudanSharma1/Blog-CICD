#!/bin/bash

DIR=$1
BASE_BRANCH=$2
EXCLUDED_FILES=(
  ":!$DIR/README.md",
  ":!$DIR/.gitignore",
)

git fetch origin "$BASE_BRANCH" --depth=1 > /dev/null 2>&1
git diff --name-only origin/"$BASE_BRANCH" -- "$DIR" "${EXCLUDED_FILES[@]}"
