#!/bin/bash

# Quick setup script
# Used to sync all projects to parent directory (same level as manifest)
# Usage: 
#   ./setup.sh              # Use HTTPS (default)
#   USE_SSH=1 ./setup.sh     # Use SSH

set -e

# Determine access method
if [ "$USE_SSH" = "1" ]; then
    BASE_URL="git@github.com:lmshao"
    echo "Using SSH access..."
else
    BASE_URL="https://github.com/lmshao"
    echo "Using HTTPS access..."
fi

echo "Starting project synchronization..."
echo "Projects will be cloned to parent directory (same level as manifest)"

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Error: Please install git first"
    exit 1
fi

# Go to parent directory
cd ..

# Create project directories and clone
projects=(
    "coreutils"
    "network" 
    "rtsp"
    "remote-desk"
)

for project in "${projects[@]}"; do
    if [ -d "$project" ]; then
        echo "Updating $project..."
        cd "$project"
        git pull origin main || git pull origin master
        cd ..
    else
        echo "Cloning $project..."
        if [ "$USE_SSH" = "1" ]; then
            git clone "${BASE_URL}/${project}.git"
        else
            git clone "${BASE_URL}/${project}.git"
        fi
    fi
done

echo "All projects synchronized successfully!"
echo ""
echo "Project structure:"
ls -la | grep "^d" | grep -v "^\.$" | grep -v "^\.\.$"
