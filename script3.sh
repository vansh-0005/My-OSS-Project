#!/bin/bash

# ==========================================================
# Script Name: log_analyzer.sh
# Purpose: Search for security or system errors in logs.
# Concepts: User input (read), Grep, Word Count (wc), and Tail.
# ==========================================================

# I'm using a common log file on Kali/Debian system
LOG_FILE="/var/log/syslog"

echo "-------------------------------------------------------"
echo "LOG SECURITY ANALYZER"
echo "-------------------------------------------------------"

# 1. Taking user input to decide what we are hunting for
echo -n "Enter the keyword to search for (e.g., ERROR, FAILED, CRITICAL): "
read KEYWORD

echo "Searching for '$KEYWORD' in $LOG_FILE..."

# 2. Counting the occurrences using grep and wc -l
COUNT=$(grep -i "$KEYWORD" "$LOG_FILE" | wc -l)

if [ "$COUNT" -gt 0 ]; then
    echo "[!] ALERT: Found $COUNT occurrences of '$KEYWORD'."
    echo "-------------------------------------------------------"
    echo "Last 5 entries found:"
    
    # 3. Showing only the most recent entries using tail
    grep -i "$KEYWORD" "$LOG_FILE" | tail -n 5
else
    echo "[OK] No entries for '$KEYWORD' were found."
fi

echo "-------------------------------------------------------"
