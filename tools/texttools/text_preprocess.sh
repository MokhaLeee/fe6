#!/bin/bash

temp_file=$(mktemp)

awk -v counter=0 '
  /^## MSG_/ {
    num = sprintf("%02X", counter)
    sub(/^## MSG_.*/, "## MSG_SHOP_" num)
    counter++
  }
  { print }
' $1
