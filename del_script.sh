#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "ERROR: Anzahl der Paramter stimmt nicht"
	exit 1
fi

PFAD=$1/*
if [[ -e $1 ]]; then
	if [[ -d $1 ]]; then
		for file in $PFAD; do
			echo $file
			if [[ -f $file ]]; then
				if [[ ! -L $file ]]; then
					rm $file
				fi
			fi
		done
	else
		echo "Pfad ist eine Datei"
		exit 3
	fi
else
	echo "Pfad exestiert nicht"
	exit 2
fi
