#Created by Brock Stuessi in February 2023
#This script copies files and confirms a copy with MD5 checksum hash

rsync -av --log-file="$3" "$1" "$2"; 

if [[ -d $1 ]]
then 
    echo "Running origin hash...";
    ORIGIN_HASH=$(find -s "$1" -type f -exec md5 -q {} \; | md5);
    echo "Running destination hash...";
    NEW_HASH=$(find -s "$2" -type f -exec md5 -q {} \; | md5);
else
    echo "Running origin hash...";
    ORIGIN_HASH=$(md5 -q "$1");
    echo "Running destination hash...";
    NEW_HASH=$(md5 -q "$2");
fi;

if [ $ORIGIN_HASH = $NEW_HASH ]
then
    printf "Origin file/dir path: $1 \nMD5 hash: $ORIGIN_HASH \n\n" >> "$3";
    printf "Destination file/dir path: $2 \nMD5 hash: $NEW_HASH \n\n" >> "$3";
    echo "MD5 checksum test passed - files copied successfully!\n\n\n"|tee -a "$3";
else
    printf "Origin file/dir path: "$1" \nMD5 hash: $ORIGIN_HASH \n\n" >> "$3";
    printf "Destination file/dir path: "$2" \nMD5 hash: $NEW_HASH \n\n" >> "$3";
    echo "MD5 checksum test failed - try alternative methods of transfer."|tee -a "$3";
fi;

# echo "Now checking for hash in provided CSV...";
# SHA_HASH=$(shasum -a 512 "$2");


# echo "The hash is associated with 

if [ $() = $NEW_HASH ]
