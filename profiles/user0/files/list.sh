#!/usr/bin/env bash

# Function to list directories recursively and sort them alphabetically
list_directories() {
    local parent_dir=$1
    local output_file=$2
    
    # Clear the output file if it exists
    > "$output_file"
    
    # Recursively find and list directories, then sort them and write to the output file
    while IFS= read -r dir; do
        echo "$dir" >> "$output_file"
    done < <(find "$parent_dir" -type d | sort)
}

# Main script execution
if [ $# -eq 0 ]; then
    echo "Usage: $0 parent_directory"
    exit 1
fi

parent_directory=$1
output_file="nested_directories.txt"

list_directories "$parent_directory" "$output_file"
echo "Directory paths have been written to $output_file"
