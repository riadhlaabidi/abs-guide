#!/bin/sh 

E_WRONG_ARGS=85

script_parameters="-a -h -m -z"


if [ $# -ne 2 ]
then 
  echo "Usage : `basename $0` $script_parameters"
  exit $E_WRONG_ARGS
fi
