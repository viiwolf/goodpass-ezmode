#!/bin/bash
# GoodPass-EZMode | Creator: Vincent Wolf,  Cyber Security Professional | https://vii.vin
# Open-source | Free for all
# Description: Easy password string generator using chosen words, randum numbers special characters and capitalization 

#Asking user for  words

#Enter first word
read -p "Enter first word: " WORD1

#Enter second word
read -p "Enter second word: " WORD2

#teststring=BlueHeaven

#Define special characters
SCHARS='~_!?@#+-&^*'


#Generate random special characters
RCHARS=${SCHARS:RANDOM % ${#SCHARS}:1}
RCHARSSET=${SCHARS:RANDOM % ${#SCHARS}:1}${SCHARS:RANDOM % ${#SCHARS}:1}

#Random positions  1 and 2
randompos=$(( RANDOM % ( 1+ ${#WORD1} + 1 ) ))
randompos2=$(( RANDOM % (1 + ${#WORD2} + 2 ) ))

#Print final password
#FINAL=${RCHARS}
FINAL1=${WORD1:0:randompos}${RCHARS}${WORD1:randompos}
FINAL2=${WORD2:0:randompos2}${RCHARSSET}${WORD2:randompos2}

#Generate Random Number
NUMBER=$(cat /dev/urandom | tr -dc '0-9' | fold -w 256 | head -n 1 | sed -e 's/^0*//' | head --bytes 3)
if [ "$NUMBER" == "" ]; then
  NUMBER=0
fi


#Generate Password 
echo "Your new secure password is:"
RESULT=${FINAL1^}${FINAL2^}${NUMBER}
echo "$RESULT"
printf "\nTotal characters in a String: ${#RESULT} "


