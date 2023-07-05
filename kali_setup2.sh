#!/bin/bash

read -p "Enter the Box Name or IP: " main_dir_name
MAIN_DIR="$main_dir_name"

SUB_DIRa="Exploits"
SUB_DIRb="Screenshots"
SUB_DIRc="Notes"

mkdir -p "$MAIN_DIR/$SUB_DIRa"
mkdir -p "$MAIN_DIR/$SUB_DIRb"
mkdir -p "$MAIN_DIR/$SUB_DIRc"

echo "Directory '$MAIN_DIR' and its subdirectories created."
