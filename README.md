# ffmpeg-mp3
Bash script to modify MP3 bitrates using ffmpeg.

# Prerequisites
You must have `ffmpeg` installed on your system.

# How to use
By default, this script will convert MP3s into 64K bitrate and will place the `output.mp3` on your desktop.

However, you can indicate the target bitrate and target output file name as such:

```
./mp3.sh <input file> <bitrate> <output file>
```

# Sample run
```
./mp3.sh ~/Downloads/podcast.mp3 128K podcast_at_128K.mp3
```

This will change `podcast.mp3` into 128K bitrate and place the output file `podcast_at_128K.mp3` into the current directory
