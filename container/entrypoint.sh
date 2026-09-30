#!/bin/sh
echo "TOKEN: $GH_TOKEN"
echo "$GH_TOKEN" | gh auth login --with-token
gh auth setup-git
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git clone "$REPO_URL" repo
exec "$@"