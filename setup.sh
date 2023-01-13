#!/bin/bash

main() {
  box_name=$1
  ip_address=$2

  mkdir -p "$PWD/$box_name/Enumeration/WebContent" "$PWD/$box_name/Enumeration/RPC" "$PWD/$box_name/Enumeration/SMB" "$PWD/$box_name/Enumeration/DNS" "$PWD/$box_name/Enumeration/LDAP" "$PWD/$box_name/Enumeration/FTP" "$PWD/$box_name/Enumeration/Usernames-and-Passwords" "$PWD/$box_name/Enumeration/SystemInfo" "$PWD/$box_name/Enumeration/Nmap" "$PWD/$box_name/Exploits" "$PWD/$box_name/Flags" "$PWD/$box_name/Notes" "$PWD/$box_name/Screenshots" "$PWD/$box_name/Scripts"
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

download_scripts() {
    cd "$PWD/$box_name/Scripts"
    git clone https://github.com/carlospolop/PEASS-ng.git
    git clone https://github.com/rebootuser/LinEnum.git
    git clone https://github.com/mzet-/linux-exploit-suggester.git
    git clone https://github.com/diego-treitos/linux-smart-enumeration.git
    git clone https://github.com/21y4d/nmapAutomator.git
  
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
  fi
}


main
