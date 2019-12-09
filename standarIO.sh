#!/bin/bash

# this script demonstrates standard IO redirection
FILE=/tmp/file
# redirect the stdout to a file
head -n3 /etc/passwd 1> ${FILE}
echo
echo "contens of the ${FILE}:"
cat ${FILE}


#redirect the stderr to file
head -n2 /etc/passwd /etc/shadow /fakefile 2> ${FILE}
echo
echo "content of the ${FILE}:"
cat ${FILE}

#redirect the stderr &stdout to file
head -n1 /etc/passwd /etc/shadow /fakefile &> ${FILE}
echo 
echo "content of the ${FILE}"
cat ${FILE}

#redirect the stdout & stderr through pipe
head -n2 /etc/passwd /fakefile |& cat -n

#send the output to STDERR
echo "this is STDERR!" >&2

#discard stdout
echo
echo "discarding stdout:"
head -n1 /etc/passwd /etc/hostname /fakefile > /dev/null

#discard stderr
echo 
echo "discarding stderr:"
head -n1 /etc/passwd /etc/hostname /fakefile 2> /dev/null

# discarding both stderr & stdout
echo
echo "discarding both stdout &stderr:"
head -n1 /etc/passwd /etc/shadow /falefile &> /dev/null

#clean up temp files
rm ${FILE} &> /dev/null

