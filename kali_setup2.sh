#!/bin/bash

read -p "Enter the Box Name or IP: " main_dir_name
MAIN_DIR="$main_dir_name"

SUB_DIRa="Exploits"
SUB_DIRb="Screenshots"
SUB_DIRc="Notes"

mkdir -p ${MAIN_DIR}/${SUB_DIRa} ${MAIN_DIR}/${SUB_DIRb} ${MAIN_DIR}/${SUB_DIRc}

echo "Directory '$MAIN_DIR' and its subdirectories created."

read -p "Do you want to scan the host with autorecon and nmapAutomator? (Yes/No): " scan_choice

if [[ "$scan_choice" =~ ^[Yy](es)?$ ]]; then
	autorecon --only-scans-dir $MAIN_DIR
else
  echo "Scanning skipped."
fi
