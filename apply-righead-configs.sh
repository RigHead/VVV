#!/bin/sh

# exit when any command fails
set -e

# define tmp folder
TMP_PATH="$TMP"
TMP_FOLDER_NAME="righead-$(echo $RANDOM | md5sum | head -c 20)"
TMP_FOLDER="$TMP_PATH/$TMP_FOLDER_NAME"

echo "Temporary folder used: $TMP_FOLDER"

git clone --depth 1 -b main 'git@github.com:RigHead/VVV-righead-configs.git' "$TMP_FOLDER"
# next step would be to utilize git submodules
# git submodule update --init --recursive ...

echo "Copying files only from righead/ subfolder..."

cp -rv "$TMP_FOLDER/righead/"* .

echo "Removing temporary folder..."

rm -rfv "$TMP_FOLDER"

echo "DONE."
