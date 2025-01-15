#!/usr/bin/env bash

# Directory to search for image files
IMAGE_DIR="../__images"

# Find and convert image files to WebP format
find "$IMAGE_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | while read -r file; do
    # Convert the image to WebP format with quality 80
    cwebp -q 80 "$file" -o "${file%.*}.webp"
done
