#!/bin/bash

#display hello local user script
echo "hello local user script"

#assign a value to a variable
WORD='script'

# display the above variable
echo "$WORD"

#diplay exact value in single quotes
echo '$WORD'

#combine variable with harcodes text
echo "this is a $WORD"

#display the variable name using alternative synatx
echo "this is my ${WORD}"

#appending text to variable
echo "${WORD}ing is a fun"

#create new variable without expansion
ENDING='ed'

#combine 2 variables WORD and ENDING
echo "this is a $WORD$ENDING."

#change the value stored in ENDING
ENDING='ing'
echo "$WORD$ENDING"

#print the UID
echo "your UID is ${UID}"

#to print username
Uname=$(id -un)
Username=`id -un`
echo "user name is ${Uname}"
echo "user name is ${Username}"

#generate random password
RAN_PASSWD=$(date +%s%N |sha256sum|head -c32)
echo "${RAN_PASSWD}"

#append speacial charecter to random password
SPECIAL_CHAR=$(echo '!"·$%&/())==?¿*^Ç¨:;~{}[]' | fold -w1 | shuf | head -c1)
echo "${SPECIAL_CHAR}"

echo "${RAN_PASSWD}${SPECIAL_CHAR}"

#to check whether u are root user or not
if [[ "$UID" -eq 0 ]]
then
 echo "you are root user"
else
 echo "your are $Username user"
fi

#test users
UserName='root'
if [[ "${Uname}" = "${UserName}" ]]; then
echo "user matched"
fi

echo "${UID}"
if [[ "${UID}" -eq 0 ]]; then
#create username and changing passwd when he login first time
read -p 'enter username want to be created: ' USER_NAME
read -p 'enter the name of the person who this account is for: ' COMMENT
read -p 'enter the user password: ' PASSWD
#below creating user and given comment in double quotes because spaces can be present in the comment and username is not in "" because it is unique
useradd -c "${COMMENT}" -m ${USER_NAME}
#below created passwd using stdin
echo ${PASSWD} | passwd --stdin ${USER_NAME}
#below we are expiring passwd first time and it will ask new passwd when login again
passwd -e ${USER_NAME}

else
 echo "run script as sudo or root user"
 exit 1
fi

