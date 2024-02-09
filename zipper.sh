#!/bin/bash

# Function to convert string to snake case
to_snake_case() {
    echo "$1" | sed 's/[^a-zA-Z0-9]/_/g' | tr '[:upper:]' '[:lower:]'
}

# Check if a project name was provided
if [ "$#" -lt   1 ]; then
    echo "Usage: $0 project_name [-x exclude_paths]"
    exit   1
fi

# Get the project name from the first argument
project_name=$1
shift

# Convert the project name to snake case
snake_case_name=$(to_snake_case "$project_name")

# Initialize the exclude options
exclude_options=""

# Process the remaining arguments as exclude options
while (( "$#" )); do
    # Check if the current argument starts with '-x'
    if [[ "$1" == "-x" ]]; then
        # Add the exclude option to the command
        exclude_options+=" $1"
        shift
        while (( "$#" )); do
            # Add each subsequent path to the exclude options
            exclude_options+=" ${project_name}/$1"
            shift
        done
        break
    else
        echo "Invalid argument: $1. Expected '-x' followed by exclude paths."
        exit   1
    fi
done

# Construct the zip command using the snake case project name and exclude options
zip -r "${snake_case_name}.zip" "${project_name}/"${exclude_options}
                                              
