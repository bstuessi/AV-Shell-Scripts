#Created by Brock Stuessi, January 27, 2023
#To run the script use: 'zsh copy_files_in_dir.sh [path of top level directory to copy] [path of directory to copy to] 

if [ ! -d $2 ]; then
mkdir $2
fi

find $1 -type f ! -name ".DS_Store" -exec cp -p -v '{}' $2 \;

FILE_NUM=$(ls $2 | wc -l)

echo "Total files copied: $FILE_NUM"
