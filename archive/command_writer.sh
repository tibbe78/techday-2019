#!/bin/bash
# Fake command writer
# reads from commands.sh and prints and run these commands whatever the user press on the keyboard.
# Made by Christofer Tibbelin + Google + Internet

# Supports multiline commdns by adding ' _' at the end of row. it will then add a '; ' instead
# Disable local echo
stty -echo
# Colors for fake command prompt
# Green
grn=$'\e[1;32m'
# Blue
blu=$'\e[1;34m'
# Guess
blink=$'\e[1;5m'
# End of colors (clear)
end=$'\e[0m'

# Store the commands file in the commands varible
commands=`cat commands.sh`
# command varible is each command we fake type in.
# This will be filled in one character at the time from the commands varible
command=''

# Our local path used to fake command prompt.
pwd=`pwd`

# Print a fake command prompt with proper colors.
# The ${pwd#*/home/cygate} splits and prints after /home/cygate in the pwd varible
printf "${grn}cygate@ubuntuV1${end}:${blu}~${pwd#*/home/cygate}${end}\$ "

# run once for each character in the commands varible
for (( i=0; i<${#commands}; i++ )); do
  # Read the input from keyboard one character at the time. silent so we don't see which key also.
  read -rsn1 input
  # Check if it's our special ending to see if it's a multiline we have to convert to a single line eval command.
  if [ "${commands:$i:3}" = $' _\n' ]; then
    # if we find the multiline ending then skip that and split the command with ';' instead
    command+=$'; '
    # jump forward to after the '\n'
    let i+=2
    # Print a fake '\n'
    printf $'\n'
  # If its a new line in the commands text then wait for a while for the user to press enter
  # This is the first part of the script to check for new line.
  elif [ "${commands:$i:1}" = $'\n' ]; then
    # Wait here until the user press enter/return.
    while [[ $input != "" ]]; do
      read -rsn1 input
    done
    # add a new line to the command. this should be when it's finished.
    command+=$'\n'
    printf $'\n'
    # Run the command in the command varible with eval so it's correct with all brackets and stuff.
    eval $command
    # Empty the command
    command=''
    printf "${grn}cygate@ubuntuV1${end}:${blu}~${pwd#*/home/cygate}${end}\$ "
  else
    # If it's not a new line the append the character to the command and print it.
    command+="${commands:$i:1}"
    printf "${commands:$i:1}"
  fi
done
# This is just for the last line of the commands.sh it don't have a ending new line character
while [[ $input != "" ]]; do
  read -rsn1 input
done
printf $'\n'
command+=$'\n'
eval $command
# Enable local echo again
stty echo
