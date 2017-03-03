#!/bin/bash

SKIN="skin.css"

# https://github.com/almasaeed2010/AdminLTE/releases
VERSION="2.3.11"

# Demo folder location:
INSTALL_DIR="demo"

# Remote repo zip file:
SOURCE_ZIP="https://github.com/almasaeed2010/AdminLTE/archive/v${VERSION}.zip"

# Clean previous installs:
rm -rf "$INSTALL_DIR"

# Create installation folder:
mkdir -pv "$INSTALL_DIR"

# Get the zip file and extract all files:
curl -sS -#L "$SOURCE_ZIP" | tar -xzv --strip-components 1 -C "$INSTALL_DIR"

# Update demo files to point at our skin:
find ${INSTALL_DIR} -type f -name '*.html' -exec sed -i '' "s,dist/css/skins/skin-blue.min.css,../${SKIN},g; s,dist/css/skins/_all-skins.min.css,../${SKIN},g" {} +

echo $'\n'"Latest version (${VERSION}) installed and paths updated to point at skin override (${SKIN})."$'\n'
