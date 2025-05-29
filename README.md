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
