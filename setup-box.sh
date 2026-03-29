#!/bin/bash
# =============================================
# Per-Box Engagement Directory Setup + Scanning
# Run with: bash setup-box.sh
# =============================================

set -euo pipefail

read -rp "Enter the Box Name or IP (e.g. 10.10.10.123 or HTB-Machine): " main_dir_name

if [[ -z "$main_dir_name" ]]; then
    echo "[-] Error: You must enter a box name or IP."
    exit 1
fi

MAIN_DIR="$main_dir_name"
SUB_EXPLOITS="Exploits"
SUB_SCREEN="Screenshots"
SUB_NOTES="Notes"
SUB_SCANS="Scans"

echo "[+] Creating directory structure for '$MAIN_DIR'..."
mkdir -p "${MAIN_DIR}"/{"${SUB_EXPLOITS}","${SUB_SCREEN}","${SUB_NOTES}","${SUB_SCANS}"}

echo "[+] Directory structure created successfully."

# Optional: Create a basic README
cat > "${MAIN_DIR}/README.md" << EOF
# Engagement: $MAIN_DIR

**Target:** $MAIN_DIR
**Date:** $(date +%Y-%m-%d)
**Status:** In Progress

## Directory Structure
- **Exploits/**     → Custom exploits & payloads
- **Screenshots/**  → Proof screenshots
- **Notes/**        → CherryTree or markdown notes
- **Scans/**        → autorecon, nmap, etc.

EOF

# Ask for scanning
read -rp "Do you want to run autorecon + nmapAutomator? (y/N): " scan_choice

if [[ "$scan_choice" =~ ^[Yy] ]]; then
    echo "[+] Starting scans... (this may take a while)"
    
    # Run autorecon (saves directly into the box directory)
    if command -v autorecon >/dev/null 2>&1; then
        echo "    [+] Running autorecon..."
        autorecon --only-scans-dir "${MAIN_DIR}/Scans" "$main_dir_name" || echo "    [-] autorecon encountered issues"
    else
        echo "    [-] autorecon not found. Skipping."
    fi

    # Run nmapAutomator if it exists
    if [[ -d "$HOME/Tools/nmapAutomator" ]]; then
        echo "    [+] Running nmapAutomator..."
        cd "$HOME/Tools/nmapAutomator" || exit 1
        ./nmapAutomator.sh -H "$main_dir_name" -t All || echo "    [-] nmapAutomator failed"
        mv -f "*${main_dir_name}*" "${MAIN_DIR}/Scans/" 2>/dev/null || true
    else
        echo "    [-] nmapAutomator not found in ~/Tools/nmapAutomator"
    fi

    echo "[+] Scanning completed. Results saved in ${MAIN_DIR}/Scans/"
else
    echo "[+] Scanning skipped."
fi

echo ""
echo "[+] Box setup finished!"
echo "    Working directory: $(pwd)/${MAIN_DIR}"
echo "    Next steps: Start enumeration and fill Notes/ & Exploits/"

