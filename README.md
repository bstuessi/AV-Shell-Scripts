# AV-Shell-Scripts

## secure_copy.sh 

This script uses rsync to copy files from source hard drives. It stores log information and a SHA-256 script of the copied file in a text file called transfer_log.txt.

### Install and setup
For Mac:
1. Download repository from GitHub
2. Copy the path to the secure_copy.sh script by right-clicking the file in Finder, hold the command key and select "Copy file as pathname"
3. Open the Terminal application
4. Determine if you are running the bash or zsh shell by typing: `echo $0`
5. Create an "alias" for the shell script:
- For -zsh: `echo "alias securecp=/.[paste file path of secure_copy.sh]" >> ~/.zshrc`
- For bash: `echo "alias securecp=/.[paste file path of secure_copy.sh]" >> ~/.bashrc`  
6. Source the rc file in terminal
- For zsh `source ~/.zshrc`
- For bash `source ~/.bashrc`
7. Confirm that the alias is working by typing: `securecp -h` if the command is working you should recieve a message that says: `Purpose: This script copies files and confirms a copy with MD5 checksum hash...`

For Windows, need additional testing...

### Usage
Syntax: `securecp -i <origin-file-full-path> -o <output-file-full-path> -l <optional-log-file-path>`

Once you have the alias setup, the above syntax should work for copying files from one place to another. The log file path is optional, if left empty the script will create and write to a log fie in the desitnation directory. Full paths from root should be used, to obtain full paths with escape keys for spaces easily on Mac, drag files from finder to the command line.



## video-access.sh

This script handles creating access copies for video files. It converts from any specified video file format to h.264/AAC codec video in a .mp4 container.

### Usage



## audio-access.sh

This script handles creating access copies for audio files. It converts from any specified audio file format to .mp3 using VBR compression. 

### Usage

