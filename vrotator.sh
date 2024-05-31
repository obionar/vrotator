#!/bin/bash

# Check if exiftool is installed, if not install it
if ! command -v exiftool &> /dev/null
then
    echo "exiftool is not installed. Installing now..."
    sudo apt update && sudo apt install -y libimage-exiftool-perl
    if [ $? -ne 0 ]; then
        echo "Failed to install exiftool. Please install it manually."
        exit 1
    fi
fi

# Determine the directory to work on
target_dir="${1:-$(pwd)}"

# Find all MP4 files in the directory (both .mp4 and .MP4)
mp4_files=($(find "$target_dir" -maxdepth 1 -iname "*.mp4"))

# Check if there are any MP4 files
if [ ${#mp4_files[@]} -eq 0 ]; then
    echo "No MP4 files found in the directory: $target_dir"
    exit 1
fi

# Print the filenames
echo "The following MP4 files will be processed in directory: $target_dir"
for file in "${mp4_files[@]}"; do
    echo "$file"
done

# Ask for user confirmation
read -p "Do you want to rotate these files? (Y/N): " confirmation

if [[ "$confirmation" != "Y" && "$confirmation" != "y" ]]; then
    echo "Operation cancelled."
    exit 1
fi

# Rotate the videos
for file in "${mp4_files[@]}"; do
    echo "Rotating $file..."
    exiftool "-Rotation=-90" "$file"
done

echo "All files have been rotated."

# Ask if user wants to delete original files
read -p "Do you want to delete the original files? (Y/N): " delete_confirmation

if [[ "$delete_confirmation" == "Y" || "$delete_confirmation" == "y" ]]; then
    echo "Deleting original files..."
    for file in "${mp4_files[@]}"; do
        original_file="${file}_original"
        if [ -f "$original_file" ]; then
            rm "$original_file"
            echo "Deleted $original_file"
        fi
    done
else
    echo "Original files were not deleted."
fi

echo "Operation completed."
