#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q moneymanagerex | awk '{print $2; exit}') # example command to get version of application here
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/scalable/apps/org.moneymanagerex.MMEX.svg
export DESKTOP=/usr/share/applications/org.moneymanagerex.MMEX.desktop

# Deploy dependencies
quick-sharun /usr/bin/mmex /usr/share/mmex

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage
