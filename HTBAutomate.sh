#!/bin/bash

main() {
  box_name=$1
  ip_address=$2

  mkdir -p "$box_name/Enumeration/WebContent" "$box_name/Enumeration/RPC" "$box_name/Enumeration/SMB" "$box_name/Enumeration/DNS" "$box_name/Enumeration/LDAP" "$box_name/Enumeration/FTP" "$box_name/Enumeration/Usernames-and-Passwords" "$box_name/Enumeration/SystemInfo" "$box_name/Enumeration/Nmap" "$box_name/Exploits" "$box_name/Flags" "$box_name/Notes" "$box_name/Screenshots" "$box_name/Scripts"
  echo "Parent directory and subdirectories created."

  if prompt_yes_no "Do you want to download external scripts for automation (e.g linpeas, nmapAutomator)? (y/n): "; then
    echo "Downloading..." 
    download_scripts
    echo "Scripts downloaded and are in the Scripts subdirectory."
  fi
  
  if prompt_yes_no "Do you want to run nmapAutomator script on the machine? (y/n): "; then
    if [[ -z $ip_address ]]; then
      ip_address=$(prompt_input "Enter the IP Address of the machine: ")
    fi
    bash "$box_name/Scripts/nmapAutomator.sh" $ip_address All
  fi
}

prompt_yes_no() {
  read -p "$1" yn
  case $yn in
    [Yy]* ) return 0;;
    [Nn]* ) return 1;;
    * ) echo "Please answer yes or no."; prompt_yes_no "$1";;
  esac
}

prompt_input() {
  read -p "$1" input
  if [[ -z $input ]]; then
    echo "Input is required."; prompt_input "$1"
  else
    echo "$input"

