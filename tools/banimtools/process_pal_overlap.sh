#!/bin/bash

file=$1

size=$(stat --format=%s "$file")
new_size=$((size - 4))

new_file="${file%.agbpal.lz}.agbpal_lz"

dd if="$file" of="$new_file" bs=1 count="$new_size" status=none

echo "Processed: $file -> $new_file"
