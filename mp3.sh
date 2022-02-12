#!/bin/sh

# ==== Globals ======================================================================
FFMPEG=/usr/local/bin/ffmpeg            # Path to ffmpeg
FILENAME=$1                             # The input file name
BITRATE=${2:-64K}                       # Default bitrate
OUTPUT=${3:-~/Desktop/output.mp3}       # Default output file name
# ===================================================================================

function convert_mp3 () {
    echo "Converting MP3 to $BITRATE ..."

    FFMPEG -v warning -i "$FILENAME" -map 0:a:0 -b:a $BITRATE $OUTPUT
}

# INIT PROGRAM
if [ $# -eq 0 ]
    then
        echo "Please enter a file name."
        exit 1
elif [ ! -f "$FILENAME" ]
    then
        echo "File $FILENAME does not exist in the current directory."
        exit 1
else
    start=$(date +%s)

    # Convert MP3
    convert_mp3

    # Clean up
    clean

    # Display final file size
    mb=$(du -h $OUTPUT | awk '{print $1}')
    echo "\nFile size: ${mb}"

    # Display elapsed time
    end=$(date +%s)
    elapsed=$(( end - start ))

    echo "Elapsed time: $elapsed seconds"
fi
