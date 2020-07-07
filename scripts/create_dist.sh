#!/usr/bin/env bash

export CLONE_LOCATION="$HOME/github-page"
export GIT_ASKPASS="$GITHUB_WORKSPACE/scripts/git_askpass_helper.sh"
export SASS_PATH="$HOME/.npm-global/bin/sass"


# Configure git alias
git config user.email "action@github.com"
git config user.name "GitHub Action"

rm -rf "$CLONE_LOCATION"

# Clone the github.io page repo
git clone "https://pabloworker@github.com/PabloPerezRodriguez/pabloperezrodriguez.github.io" "$CLONE_LOCATION"

# Delete every file in the github.io page repo but keep the CNAME file.
find "$CLONE_LOCATION" -mindepth 1 -maxdepth 1 -not -name 'CNAME' -not -name '.git' -delete


###### Actually build ######

# Create the destination directories
mkdir -p "$CLONE_LOCATION/css"
mkdir -p "$CLONE_LOCATION/js"

# Copy and build the files
$SASS_PATH "$GITHUB_WORKSPACE/src/scss":"$CLONE_LOCATION/css" || :
cp -rf "$GITHUB_WORKSPACE/src/index.html" "$CLONE_LOCATION/index.html" || :
cp -rf "$GITHUB_WORKSPACE/src/js/*" "$CLONE_LOCATION/js" || :