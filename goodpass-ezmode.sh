#!/bin/bash
# GoodPass-EZmode -- Strong Password Generator | Creator: Vincent Wolf, Cyber Security Professional | https://viiwolf.one
# Open-source | Free for all
# Version: 1.0
#
# PURPOSE:
# To create strong passwords the easy way. One person's weak password can cripple an entire organization or
# a business. As a Blue Team advocate, I have developed a simple script that makes creating a password very easy. This script
# generates passwords that will take most modern computers (in year 2022) a million years or more to crack.
#
# WHAT IT DOES:
# Easy password is a string generator using two user chosen words, random numbers, random special characters in
# random positions within the string and capitalization. Even if the same two words are chosen by different users, the output
# will almost never be the same because of the 5 different randomizations that this script uses. 
#
# EXAMPLE:
# User 1 inputs two words: snow, flower
# ViiPassEZ outputs Sn@owFlower-!413
#
# User 2 also inputs the same: snow, flower
# ViiPassEZ outputs ~snowFlower^&669
# 
# User 3 repeats and gets S&now@+flower203
# etc...
#
# ADDITIONALLY:
# You can run the script on a single line
#
# ADVICE: MEMORIZE these passwords.
#	  Do not write them down on a sticky note and post them where visible. Hackers also gather 
# 	  info physically. These passwords generated will at least give most computers hundred of thousands to millions of years
#
# BENEFITS: You will at least have a password that is unique, and safe from password wordlists. A

# Now for the script...


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


