#!/bin/bash

# Run this script to migrate the dotfiles to the home directory.

INPUT=$1

function install_dotfiles {
  echo "Copying custom files to home directory..."
  cp -rv home/.* $HOME/
  cp -rv home/misc/.* $HOME/
  echo "Copying files to system-wide config... (Needs password)"
  sudo cp -rv etc/* /etc/
}

echo "Are you sure you want to copy someone's personal configs to your setup? [Y/n]: "
read $INPUT

case $INPUT in
  [Y] ) install_dotfiles;;
  [n] ) echo "Ok. Good choice.";;
esac
