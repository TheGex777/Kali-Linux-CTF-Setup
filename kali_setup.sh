#!/bin/bash

# First, install docker manually by doing 

#sudo apt install docker.io docker-compose docker-cli. Then, restart your system and do sudo usermod -aG docker kali

#Ensure you run this script with sudo permissions

#List of packages
packages=(
autorecon
bloodhound
neo4j
nishang
terminator
ranger
flameshot
wine
sshuttle
seclists
odat
oscanner
feroxbuster
dirsearch
gobuster
jq
ffuf
)



#Install the packages
for package in "${packages[@]}"
do
sudo apt-get install -y ${package}
done

MAIN_DIR="Tools"
SUB_DIRa="Cheatsheets_Markdown"
SUB_DIRb="CherryTree_Docs"
SUB_DIRc="Linux_Scripts"
SUB_DIRd="Windows_Tools"


#Create a new directory called Tools and subdirectories
mkdir ${MAIN_DIR}
mkdir -p ${MAIN_DIR}/${SUB_DIRa} ${MAIN_DIR}/${SUB_DIRb} ${MAIN_DIR}/${SUB_DIRc} ${MAIN_DIR}/${SUB_DIRd}

#Switch to the Tools directory
cd ${MAIN_DIR}

#Download External Tools from github
git clone https://github.com/Braijan/genmap.git
git clone https://github.com/21y4d/nmapAutomator.git
git clone https://github.com/Kevin-Robertson/Powermad
git clone https://github.com/r3motecontrol/Ghostpack-CompiledBinaries.git
git clone https://github.com/dirkjanm/krbrelayx
git clone https://github.com/micahvandeusen/gMSADumper
git clone https://github.com/p0dalirius/pyLAPS
git clone https://github.com/Greenwolf/ntlm_theft
wget https://raw.githubusercontent.com/BishopFox/sliver/refs/heads/master/Dockerfile
wget https://download.sysinternals.com/files/SysinternalsSuite.zip
wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Recon/PowerView.ps1
wget https://github.com/carlospolop/PEASS-ng/releases/download/20230702-bc7ce3ac/winPEASany.exe
wget https://raw.githubusercontent.com/carlospolop/PEASS-ng/master/winPEAS/winPEASps1/winPEAS.ps1
wget https://github.com/swisskyrepo/SharpLAPS/releases/download/latest-SharpLAPS/SharpLAPS.exe
wget https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer64.exe
wget https://github.com/peass-ng/PEASS-ng/releases/download/20250518-5781f7e5/linpeas.sh
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy32
wget https://github.com/icsharpcode/AvaloniaILSpy/releases/download/v7.2-rc/Linux.x64.Release.zip

#Installing tools to run in docker
docker pull six2dez/reconftw:main
docker pull opendevsecops/git-dumper

#Move Downloaded tools to proper directories
unzip Linux.x64.Release.zip
unzip ILSpy-linux-x64-Release.zip
mv *.exe *.ps1 SysinternalsSuite.zip Ghostpack-CompiledBinaries krbrelayx gMSADumper pyLAPS ntlm_theft ${SUB_DIRd}
mv artifacts *.sh pspy32 pspy64 ${SUB_DIRc}
