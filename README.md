# AV-Shell-Scripts

## secure_copy.sh 

This script uses rsync to copy files from source hard drives. It stores log information and a SHA-256 script of the copied file in a text file called transfer_log.txt.

### Install and setup
For Mac:
1. Download repository from GitHub
2. Copy the path to the secure_copy.sh script by right-clicking the file in Finder, hold the command key and select "Copy file as pathname"
3. Open the Terminal application
4. Determine if you are running the bash or zsh shell by typing:
    echo $0
5. If you are running -zsh type:

    echo "alias securecp=/.[paste file path of secure_copy.sh]" >> ~/.zshrc

6. If you are running -bash type:

    echo "alias securecp=/.[paste file path of secure_copy.sh]" >> ~/.bashrc
    
7. 


### Usage


## video-access.sh

This script handles creating access copies for video files. It converts from any specified video file format to h.264/AAC codec video in a .mp4 container.

### Usage



## audio-access.sh

This script handles creating access copies for audio files. It converts from any specified audio file format to .mp3 using VBR compression. 

### Usage

