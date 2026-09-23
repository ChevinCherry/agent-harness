#!/bin/sh
gh auth login --with-token <<< "$GH_TOKEN"
gh auth setup-git
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git clone "$REPO_URL" repo