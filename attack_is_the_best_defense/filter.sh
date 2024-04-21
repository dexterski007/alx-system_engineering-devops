#!/bin/bash

# Input file
input_file="input.txt"

# Output file
output_file="output.txt"

# Check if input file exists
if [ ! -f "$input_file" ]; then
    echo "Input file $input_file not found."
    exit 1
fi

# Filter lines with 11 characters and write to output file
while IFS= read -r line; do
    if [ ${#line} -eq 11 ]; then
        echo "$line" >> "$output_file"
    fi
done < "$input_file"

echo "Filtered lines with 11 characters written to $output_file."

