#!/bin/bash

# Script 4: Log File Analyzer
# Usage: ./log_analyzer.sh <logfile> [keyword]

LOGFILE=$1
# Default keyword is 'error' if the second argument is missin
KEYWORD=${2:-"error"}
COUNT=0

# Check if the log file exists and is a regular file
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    exit 1
fi

# TODO: Do-while style retry if the file is empty
# In Bash, we check the file size (-s) to see if it's empty
while [ ! -s "$LOGFILE" ]; do
    echo "File is empty. Retrying in 2 seconds..."
    sleep 2
done

echo "Analyzing $LOGFILE for keyword: '$KEYWORD'..."

# Main loop: reads the file line by line
while IFS= read -r LINE; do
    # Check if the line contains the keyword (case-insensitive -i)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

# Print the summary
echo "--------------------------------------"
echo "Summary: Keyword '$KEYWORD' found $COUNT times in $LOGFILE"

# TODO: Print the last 5 matching lines using tail + grep
echo "Last 5 matching entries:"
grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
echo "--------------------------------------"
