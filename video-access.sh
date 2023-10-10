#!/bin/bash

#Help output

Help() {
    cat <<EOF
Purpose: This script creates mp3 access files for all audio files of a provided type in a directory or for a single file. 

Syntax: $0 - o <relative path to output files location> -f <optional file extension to process all files of specific type in directory> -i <optional input file path (for single file)>

EOF
exit 1
}

#Options
while getopts "i:f:o:h" option; do
    case $option in 
        f) EXT=$OPTARG ;;
        i) INPUT_FILE=$OPTARG ;;
        o) OUTPUT=$OPTARG ;;
        h) Help ;;
    esac
done

#Main function

if [[ -n "$INPUT_FILE" ]] 
then 
    	OUTPUT_FILE="${OUTPUT%/}${INPUT_FILE%.*}.mp4";
	FORMATTED_OUTPUT_FILE="${OUTPUT_FILE// /_}"
	ffmpeg -i "$INPUT_FILE" -c:v libx264 -pix_fmt yuv420p -preset medium -crf 18 -c:a aac "$FORMATTED_OUTPUT_FILE";
else
    for f in *."$EXT"; 
    do 
	OUTPUT_FILE="${OUTPUT%/}${f%.*}.mp4";
        FORMATTED_OUTPUT_FILE="${OUTPUT_FILE// /_}"
        ffmpeg -nostdin -i $f -c:v libx264 -pix_fmt yuv420p -preset medium -crf 18 -c:a aac "$FORMATTED_OUTPUT_FILE"; 
    done;
fi;
