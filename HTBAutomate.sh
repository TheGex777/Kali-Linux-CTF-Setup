#!/bin/bash

read -p "Enter the name of the box: " reply
mkdir $reply;
echo "Parent directory and subdirectories created."

make_directories(){
	cd $reply && mkdir Enumeration Exploits Flags Notes Screenshots Scripts;
	cd Enumeration && mkdir WebContent RPC SMB DNS LDAP FTP Usernames-and-Passwords SystemInfo Nmap;
	cd ..;
}

make_directories

while true; do
    read -p "Do you want to download external scripts for automation (e.g linpeas, nmapAutomator)? (y/n): " yn
    case $yn in
        [Yy]* ) echo "Downloading..." 
        wget -q https://raw.githubusercontent.com/carlospolop/PEASS-ng/master/linPEAS/linpeas.sh
        wget -q https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh
	wget -q https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh
	wget -q https://raw.githubusercontent.com/diego-treitos/linux-smart-enumeration/master/lse.sh
	wget -q https://raw.githubusercontent.com/carlospolop/PEASS-ng/master/winPEAS/winPEASbat/winPEAS.bat
	wget -q https://raw.githubusercontent.com/21y4d/nmapAutomator/master/nmapAutomator.sh
	mv *.sh *.bat Scripts && cd Scripts && chmod +x nmapAutomator.sh; 
	echo "Scripts downloaded and are in the Scripts subdirectory."
	break;;	
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true; do
    read -p "Do you want to run nmapAutomator script on the machine? (y/n): " yn
    case $yn in
        [Yy]* ) read -p "Enter the IP Address of the machine. : " IP;
        bash nmapAutomator.sh $IP All; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
