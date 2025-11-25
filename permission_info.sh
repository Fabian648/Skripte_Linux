#!/bin/bash

function to_readable {
        local result=""
	local PER=$1
        if [[ ${PER:0:1} == r ]]; then
        	result+=" read "
        fi
        if [[ ${PER:1:1} == w ]]; then
        	result+=" write "
        fi
        if [[ ${PER:2:1} == x ]]; then
        	result+=" execute "
	fi
	echo $result
}



if [[ $# -ne 1 ]]; then
	echo "Error: Falsche Anzahl an Parmetern"
	exit 1
fi
echo $1
if [[ -e $1 ]]; then
	echo "Erfolg"
	AUSGABE="The file $(basename $1) has been assigned to user $(ls -lah "$1" | awk '{print $3}') and group $(ls -lah "$1" | awk '{print $4}'), "
	if [[ -f $1 ]]; then
		PERMISSION=$(ls -ld "$1" | awk '{print $1}')

		user=${PERMISSION:1:3}   # Benutzerrechte
    		group=${PERMISSION:4:3}  # Gruppenrechte
    		others=${PERMISSION:7:3} # Rechte für andere

		echo "Berechtigungen für: $(basename $1)"
    		echo "Benutzerrechte: $user"
    		echo "Gruppenrechte: $group"
    		echo "Rechte für andere: $others"			
		
		AUSGABE+="the user is allowed to $(to_readable $user), the group is allowed to $(to_readable $group) and all others are allowed to $(to_readable $others)"
	fi
	echo $AUSGABE
fi
