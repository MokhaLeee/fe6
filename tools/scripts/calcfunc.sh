#!/bin/bash

total_func=6013

total_uncomped_func=`grep -r thumb_func_start | wc -l`
total_decomped_func=`expr $total_func - $total_uncomped_func`
total_not_matched_func=`grep -r NONMATCHING src | grep "#if"  | wc -l`

func_decomp_rate=`echo "scale=3; 100*$total_decomped_func/$total_func" | bc`

echo "$total_func functions in total, $total_decomped_func functions ($func_decomp_rate%) have been decompiled."
echo "$total_not_matched_func functions are marked as unmatched."

echo ""
echo "uncompressed asm files:"

for asm_file in $(find ./asm/ -type f); do
	uncomped_func=$(cat $asm_file | grep thumb_func_start | wc -l)
	uncomped_rate=$(awk -v p="$uncomped_func" -v t="$total_uncomped_func" 'BEGIN{printf "%.3f", (p/t)*100}')
	printf "%4d (%7s) in %s\n" "$uncomped_func" "$uncomped_rate%" "$(basename "$asm_file")"
done
