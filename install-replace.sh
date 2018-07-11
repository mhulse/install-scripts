#!/bin/bash

SKIN="skin.css"

# https://github.com/almasaeed2010/AdminLTE/releases
VERSION="2.4.3"

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

# Usage:
# Download this file into directory where you want AdminLTE.
# Make executable: `$ chmod u+x install-replace.sh`
# Run it: `$ ./install-replace.sh`
#
# Or, run this file from GitHub:
# bash <(curl -sL https://git.io/vSJlW)
#
# Finally, copy `demo/starter.html` into the parent directory
# and update it‘s asset links (css/js) to point to the `demo/` folder.
# Modify the `starter.html` template to suit your needs.
# Use the files in `demo/` as a way to preview all features of AdminLTE.
# If you want to update AdminLTE to the latest version, run this script again.
# Note: This script does not update `starter.html` for you … if you update
# AdminLTE to a new release, then you will have to manually update `starter.html`.
