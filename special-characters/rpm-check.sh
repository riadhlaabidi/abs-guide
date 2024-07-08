#!/bin/bash

# Queries an rpm file for description, listing, and whether or not it can be installed

SUCCESS=0
E_NOARGS=65


if [ -z "$1" ]
then
  echo "Usage: `basename $0` rpm-file" 
  exit $E_NOARGS
fi

{ # code bloc start
  echo 
  echo "Package description:"
  rpm -qpi $1
  echo 
  echo "Package listing:"
  rpm -qpl $1
  echo
  rpm -i --test $1
  if [ "$?" -eq $SUCCESS ]
  then
    echo "$1 can be installed."
  else
    echo "$1 cannot be installed."
  fi
  echo
} > "$1.test"  # Redirects all the code block output to a file

echo "RPM test results are in $1.test"

exit 0
