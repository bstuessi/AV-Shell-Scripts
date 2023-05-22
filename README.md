# AV-Shell-Scripts

### Install and setup
For Mac:
1. Open the terminal application
2. Follow [these directions](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) to install git.
3. Run `cd ~` to navigate to your homoe directory and `mkdir code` to make a new fodler colled "code" this will be a directory to store all scripts.
4. Run `cd code` to navigate from your root directory to your newly created "code" directory. You should now see "~/code" to the left of your cursor
5. Run `git clone https://github.com/bstuessi/AV-Shell-Scripts.git` to download the shell scripts to your folder.
6. Copy the path to the secure_copy.sh script by right-clicking the file in Finder, hold the command key and select "Copy file as pathname"
7. Determine if you are running the bash or zsh shell by typing: `echo $0`
8. Create an "alias" for the shell script so that you can run the script with a singel command in your terminal rather than the full path. Replace "securecp" in the example below depending on which script you are creating an alias for and what command you would like to use for the script: 
- For -zsh: `echo "alias securecp=/.[paste file path of secure_copy.sh]" >> ~/.zshrc`
- For bash: `echo "alias securecp=/.[paste file path of secure_copy.sh]" >> ~/.bash_aliases`  
9. Source the rc file in terminal
- For zsh `source ~/.zshrc`
- For bash `source ~/.bash_aliases`
10. Confirm that the alias is working by typing: `securecp -h` if the command is working you should recieve a message that says: `Purpose: This script copies files and confirms a copy with MD5 checksum hash...`

For Windows, need additional testing...

## secure_copy.sh 

This script uses rsync to copy files from source hard drives. It keeps a log of the files that have been copied. Additionally, it calls the dpa_search.sh function to look for the checksum of the file in Digital Bedrock. 

**See below for special dpa_search.sh install instructions before running secure_copy.sh!**

### Usage
Syntax: `securecp -i <origin-file-full-path> -o <output-file-full-path> -l <optional-log-file-path>`

**Use full paths from root.** To obtain full paths with escape keys for spaces easily on Mac, drag files from finder to the command line. 

**If you would like to assign a new name to the copied file,** specify this new name at the end of the output file path. 

**Best practice is to create directories for you copied files.** Do not simply copy the files into your Downloads or Documents folder. 

Once you have the alias setup, the above syntax should work for copying files from one place to another. The log file path is optional, if left empty the script will create and write to a log fie in the desitnation directory. 

## video-access.sh

This script handles creating access copies for video files. It converts from any specified video file format to h.264/AAC codec video in a .mp4 container.

### Usage

Navigate in terminal to the directory you are working on and use [**relative file paths**](https://www.codingrooms.com/blog/file-paths) for this function. 

Syntax: `video-access - o <relative path to output files location> -f <optional file extension to process all files of specific type in directory> -i <optional input file path (for single file)>`

*The name of the function depends on how you have set up your aliases during install.*

* One common error you may encounter during use is "Unsupported channel layout "1 channels (FL)". To fix this, open the video-access.sh and add the following line of code to both "ffmpeg" commands before the ${OUTPUT... :
  `-af channelmap=0 -b:a 128k -map 0:v -map 0:a -y`


## audio-access.sh

This script handles creating access copies for audio files. It converts from any specified audio file format to .mp3 using VBR compression. 

### Usage

Navigate in terminal to the directory you are working on and use [**relative file paths**](https://www.codingrooms.com/blog/file-paths) for this function. 

Syntax: `audio-access - o <relative path to output files location> -f <optional file extension to process all files of specific type in directory> -i <optional input file path (for single file)>`

*The name of the function depends on how you have set up your aliases during install.*


## dpa_search.sh

This script takes a file path as input, generates an MD5 checksum and searches for the checksum in the Digital Bedrock database. 

### Setup

1. Download the [combined-DPA-metadata.csv](https://drive.google.com/file/d/1_5QVz5IPyDK9ns4zPLYaxpD8Dh0rcqkR/view?usp=share_link) fro the AV 2023 folder in Google Drive. 
2. Move the file into a permanent location.
3. Copy the file path to the file by right clicking the file in Finder, holdidng down option, and selecting "Copy file as pathname"
4. Open dpa_search.sh in a text editor
5. Find the line marked `# CHANGE THIS LINE TO LOCATION OF CSV!`
6. Replace the path following `DPA=` to the path you just copied
7. Save and close the file

### Usage

Syntax: `dpa_search -d <optional path to DPA csv file> <path of file to check>`

*The name of the function depends on how you have set up your aliases during install.*

The -d option allows you to reference the csv path without modifying code in the .sh file.

  




