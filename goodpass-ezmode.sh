#!/bin/bash
# GoodPass-EZMode | Creator: Vincent Wolf,  Cyber Security Professional | https://vii.vin
# Open-source | Free for all
# Description: Easy password string generator using chosen words, randum numbers special characters and capitalization 

# Asking user for  words -- alphanumeric with no content filter

# Enter first word
read -p "Enter first word: " WORD1

# Enter second word
read -p "Enter second word: " WORD2

# Define special characters
SCHARS='~_!?@#+-&^*'


# Generate random special characters for both words
RCHARS=${SCHARS:RANDOM % ${#SCHARS}:1}
RCHARSSET=${SCHARS:RANDOM % ${#SCHARS}:1}${SCHARS:RANDOM % ${#SCHARS}:1}

# Random positions  1 and 2 for first and second words respectively
randompos=$(( RANDOM % ( 1+ ${#WORD1} + 1 ) ))
randompos2=$(( RANDOM % (1 + ${#WORD2} + 2 ) ))

# Print final password
# Add single character special character variable into random position inclusively to first word
# Currently negates first letter capitalization if in first position
FINAL1=${WORD1:0:randompos}${RCHARS}${WORD1:randompos}
# Add 2 character special character variables into random position inclusively to second word
# Currently negates first letter capitalization if in first position
FINAL2=${WORD2:0:randompos2}${RCHARSSET}${WORD2:randompos2}

# Generate Random Number with 3 digits
NUMBER=$(cat /dev/urandom | tr -dc '0-9' | fold -w 256 | head -n 1 | sed -e 's/^0*//' | head --bytes 3)
if [ "$NUMBER" == "" ]; then
  NUMBER=0
fi


# Generate Password 
printf "\nYour new secure password is:"
# Combine all main variables into single variable
RESULT=${FINAL1^}${FINAL2^}${NUMBER}
# Print the strong password
echo "$RESULT"
# Print number of characters on new line
printf "\nTotal characters in a String: ${#RESULT} "
