#!/usr/bin/env bash

export CLONE_LOCATION="$HOME/github-page"
export GIT_ASKPASS="$GITHUB_WORKSPACE/scripts/git_askpass_helper.sh"

cd $GITHUB_WORKSPACE
export COMMIT_HASH=$(git rev-parse HEAD)

cd $CLONE_LOCATION

# Configure git alias
git config user.email "action@github.com"
git config user.name "GitHub Action"

git add .

git commit -m "Automated build of $COMMIT_HASH"

git push origin master