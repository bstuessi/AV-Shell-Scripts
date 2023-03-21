#Help output

Help() {
    cat <<EOF
Purpose: This script creates mp3 access files for all audio files of a provided type in a directory. 

Syntax: $0 - o <relative path to output files> -f <input file extension> -i <optional input file path (for single file)>

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
    ffmpeg -i "$INPUT_FILE" -write_id3v1 1 -id3v2_version 3 -dither_method triangular -qscale:a 1 "$OUTPUT"${INPUT_FILE%."$EXT"}.mp3;
else
    for f in *."$EXT"; 
    do 
        ffmpeg -nostdin -i "$f" -write_id3v1 1 -id3v2_version 3 -dither_method triangular -qscale:a 1 "$OUTPUT"${f%."$EXT"}.mp3; 
    done;
fi;
