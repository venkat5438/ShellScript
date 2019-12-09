#!/bin/bash

#creating log function below
log() {
echo "calling log function"
}

log

#creating anotehr function with local variable
func() {
#this function send messages to syslog and to standard output if VERBOSE is true.
local message="${@}"
if [[ "${VERBOSE}" = 'true' ]]; then
echo "${message}"
fi
logger -t function.sh "${message}"
}

#backing up files
backup_file() {
#this function creates a backup of a file. returns non zero stattus on error.
local FILE="${1}"
#make sure the above file exist or not
if [[ -f "${FILE}" ]]; then
 local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
 echo "backing up ${FILE} to ${BACKUP_FILE}"

#the exit status of the function will be the exit status of the copy command
 cp -p "${FILE}" "${BACKUP_FILE}"
else
 #the file does not exist return a non zero status.
 return 1
fi
}

#below we are calling function func with arguments
readonly VERBOSE='true'
func "hello"
func "this my ${0} script and passed"

#below calling function backup_files with argument
backup_file '/etc/passwd'

#below we check the file backup succeded or not
if [[ "${?}" -eq '0' ]]; then
 echo "file backup succeeded"
else
 echo "file backup failed"
exit 1
fi
