#!/usr/bin/env bash

set -e

IMAGES=./images/fulls/*.jpg
THUMBNAIL_DIR=./images/thumbs
THUMBNAIL_SIZE='^448x297'

trap "echo; echo 'Abort!'; exit 0" SIGINT SIGTERM

# Remove exif data
echo "Remove exif data..."
exiftool -all= $IMAGES
exiftool -delete_original! $IMAGES
echo

# Create thumbnails
echo "Create thumbnails..."
for file in $IMAGES; do
  basename=$(basename $file)
  echo -en "Convert $basename\r"
  convert $file -thumbnail $THUMBNAIL_SIZE -gravity center -background black -format jpg -quality 75 $THUMBNAIL_DIR/$basename
done
echo

echo "Done. Run \`ruby ./create_image_html.rb\`"
