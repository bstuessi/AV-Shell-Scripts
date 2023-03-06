#Help output

Help() {
    cat <<EOF
Purpose: This script creates mp3 access files for all audio files of a provided type in a directory. 

Syntax: $0 - o <optional relative path to output files include hanging '/'> -f <input file extension> -i <optional input file path (for single file)>

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
    ffmpeg -i "$INPUT_FILE" -c:v libx264 -pix_fmt yuv420p -preset medium -crf 18 -c:a aac "$OUTPUT"${f%."$EXT"}.mp3;
else
    for f in *."$EXT"; 
    do 
        ffmpeg -nostdin -i $f -c:v libx264 -pix_fmt yuv420p -preset medium -crf 18 -c:a aac "$OUTPUT"${f%."$EXT"}.mp3; 
    done;
fi;
