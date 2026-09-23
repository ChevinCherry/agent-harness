#!/bin/sh
set -e
cd /workspace/repo
BRANCH="$1"
SPEC_PATH="$2"
git fetch origin
git checkout $BRANCH
git pull origin $BRANCH
if [ ! -f $SPEC_PATH ]; then
    echo "No spec file found at $SPEC_PATH on branch $BRANCH" >&2
    exit 1
fi
claude -p "Follow the spec at $SPEC_PATH" --output-format json