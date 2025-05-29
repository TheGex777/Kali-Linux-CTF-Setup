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


