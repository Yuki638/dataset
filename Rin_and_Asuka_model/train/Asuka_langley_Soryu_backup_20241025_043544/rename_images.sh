#!/bin/bash

# Get the directory from the first argument
directory="$1"

# Create a backup of the current files
backup_dir="${directory}_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$backup_dir"
cp "$directory"/* "$backup_dir/"

# Counter for numbering images
counter=1

# Rename jpg and png files
for img in "$directory"/*.{jpg,png}; do
    if [ -f "$img" ]; then
        # Get the extension of the image
        extension="${img##*.}"
        # Rename the image
        mv "$img" "$directory/AsukaChwann_$counter.$extension"
        ((counter++))
    fi
done

echo "Renaming completed! Backup of the original files is in $backup_dir."

