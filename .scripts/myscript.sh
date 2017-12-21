#!/bin/bash

EMERGE="emerge --sync"
EMERGE_UPDATE="emerge -avDuN @world @security"
CHOICE="$1"

echo "Do you want to sync Portage? (Case sensitive) [Y/n]: "
read $CHOICE

if [ "$CHOICE" = "Y" ]; then
	sudo $EMERGE
fi


echo "Do you want to update your system? (Case sensitive) [Y/n]: "
read $CHOICE

if [ "$CHOICE" = "Y" ]; then
	sudo $EMERGE_UPDATE
fi
