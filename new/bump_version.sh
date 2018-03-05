#!/bin/sh
pip3 install -q --user bump2version

set -e

CHANGE=$1
CURRENT_VER=$(git describe --tag)
NEW_VER=$(bump2version --current-version=$CURRENT_VER --dry-run --list $CHANGE)
TAG_VER=$($NEW_VER | grep new_version | sed -r s,"^.*=",,)

echo "Bumping ($CHANGE) from $CURRENT_VER to $NEW_VER..."
