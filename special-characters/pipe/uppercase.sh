#!/bin/sh 

# Changes input to uppercase
# To test this script pipe the output of ls command to this script
# ls -l | ./uppercase.sh

#  NOTE: A pipe runs as a child process, therefore cannot alter script variables

tr 'a-z' 'A-Z' 

exit 0

