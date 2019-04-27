#!/bin/bash

# Fake Intro writer
# Made by Christofer Tibbelin + Google + Internet

# Supports multiline commdns by adding ' _' at the end of row. it will then add a '; ' instead

# Disable local echo
stty -echo

# Colors for fake command prompt
# Green
grn=$'\e[1;32m'
red=$'\e[1;31m'
# Blue
blu=$'\e[1;34m'
# Guess
bold=$'\e[1m'
# Bold Blink yellow
bldBlink=$'\e[1;5;33m'
#inverted
invrt=$'\e[1;7m'
# End of colors (clear)
end=$'\e[0m'
# Carrier feed
ent=$'\n'
eval 'clear'
# Store the introText file in the introText varible
introText="Hej
Jag heter Christofer Tibbelin.
Jobbar som SäkerhetsArkitekt _
 på Cygate.
Jag ska idag prata om automation _
 och då speciellt om RedHat Ansible.
Men det finns ju mycket ${grn}mer${end} man _
 kan använda ${bldBlink}AUTOMATION${end} till. _
Exempelsvis kan man ju skriva ett ${blu}script${end} _
 som skriver det man vill skriva oavsett _
 vilken tangent man trycker på... ${invrt}:)${end}
Ni är alla ${red}varmt${end} ${grn}välkommna!!${end}"

# Print a fake command prompt with proper colors.
printf "${grn}\$${end} "

# run once for each character in the introText varible
for (( i=0; i<${#introText}; i++ )); do
  # Read the input from keyboard one character at the time. silent so we don't see which key also.
  read -rsn1 input
  # check for the colors and jump over them if found
  if [ "${introText:$i:${#bold}}" = ${bold} ]; then
    printf "${introText:$i:(${#bold}+1)}"
    let i+=${#bold}
  elif [ "${introText:$i:${#end}}" = ${end} ]; then
    printf "${introText:$i:(${#end})}"
    let i+=(${#end} - 1)
  elif [ "${introText:$i:${#invrt}}" = ${invrt} ]; then
    printf "${introText:$i:(${#invrt}+1)}"
    let i+=${#invrt}
  elif [ "${introText:$i:${#grn}}" = ${grn} ]; then
    printf "${introText:$i:(${#grn}+1)}"
    let i+=${#grn}
  elif [ "${introText:$i:${#red}}" = ${red} ]; then
    printf "${introText:$i:(${#red}+1)}"
    let i+=${#red}
  elif [ "${introText:$i:${#blu}}" = ${blu} ]; then
    printf "${introText:$i:(${#blu}+1)}"
    let i+=${#blu}
  elif [ "${introText:$i:${#bldBlink}}" = ${bldBlink} ]; then
    printf "${introText:$i:(${#bldBlink}+1)}"
    let i+=${#bldBlink}
  # Check if it's our special ending to see if it's a multiline we have to convert to a single line eval command.
  elif [ "${introText:$i:3}" = $' _\n' ]; then
    # if we find the multiline ending then skip that and split the command with ';' instead
    # jump forward to after the '\n'
    let i+=2
    # Print a fake '\n'
    printf $'\n'
  # If its a new line in the introText text then wait for a while for the user to press enter
  # This is the first part of the script to check for new line.
  elif [ "${introText:$i:1}" = $'\n' ]; then
    # Wait here until the user press enter/return.
    while [[ $input != "" ]]; do
      read -rsn1 input
    done
    # add a new line to the command. this should be when it's finished.
    printf $'\n'

    # Print prompt again
    printf "${grn}\$${end} "
  else
    # If it's not a new line the append the character to the command and print it.
    printf "${introText:$i:1}"
  fi
done
#last row with enter
while [[ $input != "" ]]; do
  read -rsn1 input
done
printf $'\n'

# Enable local echo again
stty echo
