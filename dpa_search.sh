#!/bin/zsh

#Created by Brock Stuessi in May 2023
#This script copies files and confirms a copy with MD5 checksum hash

#Help output

Help() {
    cat <<EOF
Purpose: Creates an MD5 hash for a file and checks to see if that hash is in the Digital Bedrock database. If it is, it will print the File ID for the found match.

Syntax: dpa_search -d <optional path to DPA csv file> <path of file to check>
EOF
exit 1
}

unset DPA_SEARCH SEARCH_ARR FILE

#Options
while getopts ":d:h" option; do
    case $option in 
        d) DPA="$OPTARG" ;;
        h) Help ;;
    esac
done

if [[ -n $DPA ]]
    then 
        continue
    else
    # CHANGE THIS LINE TO LOCATION OF CSV!
        DPA='/Users/mkf26/Documents/code/shell-scripts/csvs/combined-DPA-metadata.csv'
fi;

FILE="$1"

if [[ -d "$FILE" ]]
    then
    echo ""$FILE" is a directory \n"
    exit
fi;

if [[ ${FILE:t} == "transfer_log.txt" ]]
    then 
    exit
fi;

echo "Generating MD5 checksum for file and searching in DPA...\n"

MD5_HASH=$(md5 -q "$FILE")

echo "MD5 checksumfor ${FILE:t} is: $MD5_HASH"

DPA_SEARCH=$(grep "${MD5_HASH}" "$DPA")


if [[ -z "$DPA_SEARCH" ]]
then
    echo "The checksum for ${FILE:t} does not appear in the DPA list"
else
    IFS="," read -rA SEARCH_ARR <<< $DPA_SEARCH
    echo "The checksum for ${FILE:t} appears in DPA and is associated with DPA file: ${SEARCH_ARR[3]}"
fi;