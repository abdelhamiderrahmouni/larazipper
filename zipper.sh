#!/bin/bash

# Function to convert string to snake case
to_snake_case() {
    echo "$1" | sed 's/[^a-zA-Z0-9]/_/g' | tr '[:upper:]' '[:lower:]'
}

# Check if a project name was provided
if [ "$#" -ne   1 ]; then
    echo "Usage: $0 project_name"
    exit   1
fi

# Get the project name from the first argument
project_name=$1

# Convert the project name to snake case
snake_case_name=$(to_snake_case "$project_name")

# Construct the zip command using the snake case project name
zip -r "${snake_case_name}.zip" "${project_name}/" -x "${project_name}/.git/**/*" -x "${project_name}/node_modules/**/*" -x "${project_name}/.env" -x "${project_name}/storage/**/*" -x "${project_name}/public/storage/**/*"
