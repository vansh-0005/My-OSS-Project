#!/bin/bash

# Unit 5: Open Source Manifesto Generato
# Author: Sankalp Tripathi (24BCY10005)
# Note: I could set an alias for this like: alias gen='./manifesto_gen.sh'

echo "--- Welcome to the Manifesto Builder ---"
echo "Please answer a few questions to build your philosophy statement."
echo ""

# 1. Using 'read' for interactive user input
read -p "What is your name? " user_name
read -p "What is your favorite open source tool (e.g., Linux, Git)? " fav_tool
read -p "In one word, why do you like Open Source? " reason

# 2. Getting the current date
current_date=$(date +%D)

# 3. String concatenation to build the manifesto paragraph
# We keep the language simple and direct
line1="I, $user_name, believe that software should be open to everyone."
line2="My journey started with $fav_tool, which taught me the power of community."
line3="To me, the core of open source is $reason."
line4="Generated on: $current_date"

# Combine them into a single block
manifesto_text="$line1 $line2 $line3 $line4"

# 4. Writing to a file using '>'
# This creates a new file or overwrites an existing one
echo "$manifesto_text" > my_manifesto.txt

echo ""
echo "Done! Your personalized manifesto has been saved to 'my_manifesto.txt'."
echo "----------------------------------------"
