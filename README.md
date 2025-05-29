# Kali Linux CTF Environment Setup

This repo contains my personal bash scripts I use when I need to create a fresh Kali VM. Inside the repo, there are two files with the following names:

kali_setup.sh 
kali_setup2.sh

Before you run any of these scripts do, ensure that you manually install docker inside the Kali VM and add your user to the docker group:

sudo apt install docker.io docker-compose docker-cli. Restart the system and then do "sudo usermod -aG docker kali." You can then logout and log back into the desktop afterwords.

Also, you'll want to run kali_setup.sh inside the /home folder before you use the second script.

The first script will download a variety of packages that can be installed natively to Kali Linux. Afterwords, it will create a directory structure for downloaded tools that are not available in the Kali repo. You can add any additional tools you want inside the script. Below is non-exhaustive list of tools that are my personal favorites:

Terminator - Terminal Emulator that allows you to quickly create multiple windows in one pane. Allows screenshotting and logging functionality.
Flameshot - Screenshot utility for capturing web pages or console output.
Ranger - Terminal-based file explorer that lets you quickly navigate folders and automatically opens text files with nano.
autorecon - automated framework that does the heavy lifting for gathering information about a CTF machine
nmapAutomator.sh - bash script that automates the process of thoroughly scanning network ports on a target.

Additionally, it will create a docker container for tools that take up a lot of space or aren't natively supported by Kali. ReconFTW is an automated franmework used for real life pentesting, so you can use that for real targets if you're not interested in CTF challenges.

The second script can be used to automate the process of creating a directory structure for the CTF machine you want to exploit. It will also ask you for the machine IP or hostname and if you want to run the autorecon script.You can place this script in the directory of your choice and it will do its magic.



