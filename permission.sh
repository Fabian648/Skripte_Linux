#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Aufruf $0 DATEINAME"
	exit 1
fi

if ! [[ -f $1 ]]; then
	echo "DATEINAME muss auf eine reguläre Datei  zeigen"
	exit 2
fi

permissions_to_text(){
	if [[ $# -ne 1 ]]; then
		exit 1
	fi
	R=$( echo "$1" | grep -oP "^[-r]" )
	W=$( echo "$1" | grep -oP "^[-r]\K[-w]")
	X=$( echo "$1" | grep -oP "^[-r][-w]\K[-x]" )
	result=""
	if [[ $R == "r" ]]; then
		result="has the permission to read
}
file_info=$(ls -lah $1)

user_permissions=$(echo $file_info | grep -oP "^.\K[-rwx]{3}")
group_permissions=$(echo $file_info | grep -oP "^.[-rwx]{3}\K[-rwx]{3}")
other_permissions=$(echo $file_info | grep -oP "^.[-rwx]{6}\K[-rwx]{3}")

echo "Gefunden:"
echo "Nutzer: $user_permissions"
echo "Gruppe: $group_permissions"
echo "Other: $other_permissions"
