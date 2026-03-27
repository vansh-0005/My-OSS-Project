#!/bin/bash

# ==========================================================
# Script Name: package_inspector.sh
# Purpose: To audit the presence of Git on my Kali system.
# Concepts: Dpkg, Case statements, Grep, and If-Else logic.
# ==========================================================

# I'm defining my target software 
SOFTWARE="git"

echo "--- Starting Package Audit for: $SOFTWARE ---"

# 1. Checking if the package is installed using dpkg (standard for Kali/Debian)
# I'm piping the output to grep to see if the status is 'installed'
if dpkg -l | grep -q "^ii  $SOFTWARE "; then
    
    # 2. If found, let's grab the specific version string
    VERSION=$(git --version | awk '{print $3}')
    echo "[FOUND] $SOFTWARE version $VERSION is correctly installed."
    
    # 3. Using a CASE statement to describe the software's role
    # This makes the script easily expandable for other tools later
    case $SOFTWARE in
        "git")
            echo "Purpose: This is a Distributed Version Control System (DVCS)."
            echo "It handles source code integrity and collaboration."
            ;;
        "apache2")
            echo "Purpose: This is a robust Open Source HTTP Web Server."
            ;;
        *)
            echo "Purpose: This is an unidentified Open Source utility."
            ;;
    esac
else
    # 4. Error handling if I haven't installed it yet
    echo "[MISSING] $SOFTWARE was not found on this system."
    echo "Action: Run 'sudo apt update && sudo apt install $SOFTWARE' to fix this."
fi

echo "--- Audit Complete ---"
