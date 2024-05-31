# vrotator

This script rotates all MP4 files in a directory by -90 degrees using `exiftool`. It's particularly useful for adjusting the orientation of vertical videos shot for social media platforms like Instagram Reels.

## Use Case

I created this script because my Canon EOS M100 camera doesn't automatically change the movie orientation information when I shoot vertical videos. Manually rotating each clip in a video editor was time-consuming, so I developed this script to automate the process.

## Requirements

- `exiftool` (The script will attempt to install it if not already installed)

## Usage

Make the script executable
   ```bash
   chmod +x vrotator.sh
```

Run the script to work on the current directory:

```bash
./vrotator.sh
```

Alternatively, specify a directory to work on:

```bash
./vrotator.sh /path/to/directory
```
The script will:

Check for exiftool and install it if necessary.
Find all MP4 files (case-insensitive) in the specified or current directory.
Print the filenames and ask for confirmation before rotating.
Rotate the videos by -90 degrees.
Ask if you want to delete the original files after rotation.

Example Use
Scenario: Rotating Videos in the Current Directory
You have several MP4 videos in your current directory that were recorded vertically. You want to rotate these videos by -90 degrees for proper viewing.

Open your terminal and navigate to the directory containing your videos:

```bash
cd /path/to/your/videos
```

Run the script without any arguments:

```bash
./vrotator.sh
```
Follow the prompts:

```bash
$ ./vrotator.sh
The following MP4 files will be processed in directory: /path/to/your/videos
./video1.mp4
./video2.MP4
Do you want to rotate these files? (Y/N): Y
Rotating ./video1.mp4...
Rotating ./video2.MP4...
All files have been rotated.
Do you want to delete the original files? (Y/N): Y
Deleting original files...
Deleted ./video1.mp4_original
Deleted ./video2.MP4_original
Operation completed.
Scenario: Rotating Videos in a Specified Directory
You have a different directory containing MP4 videos that you want to rotate.
```

Run the script and specify the directory:

```bash
./vrotator.sh /path/to/directory
```

Follow the prompts:

```bash
$ ./vrotator.sh /path/to/directory
The following MP4 files will be processed in directory: /path/to/directory
./video3.mp4
./video4.MP4
Do you want to rotate these files? (Y/N): Y
Rotating ./video3.mp4...
Rotating ./video4.MP4...
All files have been rotated.
Do you want to delete the original files? (Y/N): Y
Deleting original files...
Deleted ./video3.mp4_original
Deleted ./video4.MP4_original
Operation completed.
```