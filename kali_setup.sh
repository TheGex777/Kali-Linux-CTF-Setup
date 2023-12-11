!/bin/bash


#List of packages
packages=(
docker
docker-compose
bloodhound
bloodhound-python
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
jq
ldap-utils
ffuf
python3-certipy
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

#Install Sliver
curl https://sliver.sh/install|sudo bash

#Switch to the Tools directory
cd ${MAIN_DIR}

#Download External Tools
pip3 install git-dumper
sudo python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git
git clone https://github.com/21y4d/nmapAutomator.git
git clone https://github.com/Kevin-Robertson/Powermad
wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Recon/PowerView.ps1
wget https://github.com/carlospolop/PEASS-ng/releases/download/20230702-bc7ce3ac/winPEASany.exe
wget https://raw.githubusercontent.com/carlospolop/PEASS-ng/master/winPEAS/winPEASps1/winPEAS.ps1
wget https://github.com/swisskyrepo/SharpLAPS/releases/download/latest-SharpLAPS/SharpLAPS.exe
git clone https://github.com/r3motecontrol/Ghostpack-CompiledBinaries.git
wget https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer64.exe
wget https://download.sysinternals.com/files/SysinternalsSuite.zip
git clone https://github.com/dirkjanm/krbrelayx
git clone https://github.com/micahvandeusen/gMSADumper
git clone https://github.com/p0dalirius/pyLAPS
git clone https://github.com/Greenwolf/ntlm_theft
wget https://github.com/carlospolop/PEASS-ng/releases/download/20230702-bc7ce3ac/linpeas.sh
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy32
wget https://github.com/icsharpcode/AvaloniaILSpy/releases/download/v7.2-rc/Linux.x64.Release.zip
wget https://raw.githubusercontent.com/TheGex777/OSCP-Resources/main/recon_template.ctb


#Move Downloaded tools to proper directories
unzip Linux.x64.Release.zip
unzip ILSpy-linux-x64-Release.zip
mv *.exe *.ps1 SysinternalsSuite.zip ${SUB_DIRe}
mv Ghostpack-CompiledBinaries krbrelayx gMSADumper pyLAPS ntlm_theft ${SUB_DIRe}
mv artifacts ${SUB_DIRd}
mv linpeas.sh pspy32 pspy64 ${SUB_DIRd}
sudo cp nmapAutomator/nmapAutomator.sh /bin
