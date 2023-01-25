#!/usr/bin/env bash


dnator () {
  differences=0
  chars="$1"
  second="$2"
  strand=${#chars}
  if [ $# != 2 ]
  then
      echo "Usage: hamming.sh <string1> <string2>"
      exit 1
    elif [ -z "$1" ] && [ -z "$2" ]
    then
      let differences+=0
    elif [ -z "$1" ] || [ -z "$2" ]
    then
      echo "strands must be of equal length"
      exit 1
    elif [[ ${#chars} != ${#second} ]]
    then
      echo "strands must be of equal length"
      exit 1
  fi

  for (( i=0; i<$strand; i++ ));
    do
      if [[ ${chars:i:1} != "${second:i:1}" ]]
      then
        let differences+=1
      fi
    done
  echo "$differences"
}

dnator "$@"
