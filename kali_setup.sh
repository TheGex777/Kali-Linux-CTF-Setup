#!/bin/bash

#List of packages
packages=(
docker
docker-compose
bloodhound
bloodhound.py
neo4j
nishang
terminator
flameshot
redis-tools
wine
evil-winrm
shellter
sshuttle
Mingw-64
seclists
odat
oscanner
neo4j
feroxbuster
wkhtmltopdf
ldapsearch
dirsearch
gobuster
enum4linux
impacket-scripts
sslscan
whatweb
python3-pip
tnscmd10g
)

#Install the packages
for package in "${packages[@]}"
do
sudo apt-get install -y ${package}
done

MAIN_DIR="Tools"
SUB_DIRa="Cheatsheets_Markdown"
SUB_DIRb="CherryTree_Docs"
SUB_DIRc="CherryTree_Docs"
SUB_DIRd="Linux_Scripts"
SUB_DIRe="Windows_Tools"


#Create a new directory called Tools and subdirectories
mkdir ${MAIN_DIR}
mkdir -p ${MAIN_DIR}/${SUB_DIRa} ${MAIN_DIR}/${SUB_DIRb} ${MAIN_DIR}/${SUB_DIRc} ${MAIN_DIR}/${SUB_DIRd} ${MAIN_DIR}/${SUB_DIRe}


#Switch to the Tools directory
cd ${MAIN_DIR}
#Grab external recon tools with git or wget
git clone https://github.com/21y4d/nmapAutomator.git
wget https://github.com/carlospolop/PEASS-ng/releases/download/20230702-bc7ce3ac/linpeas.sh
wget https://github.com/carlospolop/PEASS-ng/releases/download/20230702-bc7ce3ac/winPEASany.exe
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy32
wget https://raw.githubusercontent.com/TheGex777/OSCP-Resources/main/recon_template.ctb
sudo cp nmapAutomator/nmapAutomator.sh /bin
sudo python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git
