# Kali Linux CTF Environment Setup

This repo contains my personal Bash scripts that I use to create a fresh Kali VM. The scripts help automate the setup process and ensure that all necessary tools and configurations are in place.

## Files

- `kali_setup.sh`
- `kali_setup2.sh`

## Prerequisites

Before running any of these scripts, ensure that you have manually installed Docker inside the Kali VM and added your user to the Docker group:

```bash
sudo apt install docker.io docker-compose docker-cli
sudo systemctl restart docker
sudo usermod -aG docker kali
```
## Usage
1. Run kali_setup.sh: This script should be run from the /home folder before using the second script.

```bash
cd /home
./kali_setup.sh
```
2. Run kali_setup2.sh: This script can be placed in the directory of your choice and will create a directory structure for the CTF machine you want to exploit.

```bash
./kali_setup2.sh
```
## Script Details

- `kali_setup.sh`

This script performs the following tasks:

    Downloads and installs a variety of packages that can be installed natively to Kali Linux.
    Creates a directory structure for downloaded tools that are not available in the Kali repo.
    Sets up a Docker container for tools that take up a lot of space or aren't natively supported by Kali.

### Tools Installed (Personal Favorites)

    Terminator: Terminal emulator that allows you to quickly create multiple windows in one pane, with screenshotting and logging functionality.
    Flameshot: Screenshot utility for capturing web pages or console output.
    Ranger: Terminal-based file explorer for quick navigation and text file editing with nano.
    autorecon: Automated framework for gathering information about a CTF machine.
    nmapAutomator.sh: Bash script that automates thorough network port scanning.

### Docker Container

    ReconFTW: Automated framework used for real-life pentesting.

- `kali_setup2.sh`

This script automates the process of creating a directory structure for the CTF machine you want to exploit. It will prompt you for the machine's IP or hostname and ask if you want to run the autorecon script.
