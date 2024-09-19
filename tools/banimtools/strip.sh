#!/bin/bash

input=$1
output=$2

size=$(stat --format=%s "$input")
new_size=$((size - 4))

dd if="$input" of="$output" bs=1 count="$new_size" status=none
