#!/bin/bash

#this script demonstrates case 

read -p "you want to execute this script y/n:" change
if [[ ${change} == "y" ]] || [[ ${change} == "Y" ]]; then
echo "script executed"
echo "my current working directory is: $(pwd)"
fi

if [[ "${1}" == "start" ]]; then
echo "starting"
elif [[ "${1}" == "stop" ]]; then
echo "stopping"
else
echo "enter valid argument" >&2
#exit 1
fi

case "${1}" in
 start|push)
   echo "starting my script"
   ;;
 stop|pull)
   echo "stopping my script"
   ;;
  *)
   echo "supply valid argument to the case: start,stop"
   exit 1
   ;;
esac
