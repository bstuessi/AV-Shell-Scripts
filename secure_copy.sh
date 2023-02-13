#Created by Brock Stuessi in February 2023
#This script copies files and confirms a copy with MD5 checksum hash

cp -v -p -r "$1" "$2"; 

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
    echo "MD5 checksum test passed - files copied successfully!";
else
    echo "MD5 checksum test failed - try alternative methods of transfer.";
fi;

