#!/bin/bash

# Colors for fake command prompt
# Green
grn=$'\e[1;32m'
# Blue
blu=$'\e[1;34m'
# Guess
blink=$'\e[1;5m'
# End of colors
end=$'\e[0m'
# Store the commands file in the commands varible
commands=`cat commands.sh`
# command varible is each command we fake type in.
command=''

# Our local path
pwd=`pwd`

# Print a fake command prompt with proper colors.
printf "${grn}cygate@ubuntuV1${end}:${blu}~${pwd#*/home/cygate}${end}\$ "


for (( i=0; i<${#commands}; i++ )); do
  read -rsn1 input
  if [ "${commands:$i:1}" = $'\n' ]; then
    while [[ $input != "" ]]; do
      read -rsn1 input
    done
    command+=$'\n'
    printf $'\n'
    eval $command
    command=''
printf "${grn}cygate@ubuntuV1${end}:${blu}~${pwd#*/home/cygate}${end}\$ "
  else
    command+="${commands:$i:1}"
    printf "${commands:$i:1}"
  fi
done
while [[ $input != "" ]]; do
  read -rsn1 input
done
printf $'\n'
command+=$'\n'
eval $command
