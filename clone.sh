#!/bin/bash

str="$1"
IFS="."
while true; do
if [ "$str" != *".git" ]; then
	echo Invalid link!
	echo Enter a valid link:
	read str
	read -ra ADDR <<< "$str"
	if [ "${ADDR[2]}" == "git" ]; then
		git clone "$str"
		return
	fi
else
	git clone "$str"
	return
fi
done

