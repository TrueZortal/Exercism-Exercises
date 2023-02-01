#!/usr/bin/env bash

drippidydrop () {
  message=""
  remainder=$(($1%3))
  if [ $remainder = 0 ]
    then
      message+="Pling"
  fi

  remainder=$(($1%5))
  if [ $remainder = 0 ]
    then
      message+="Plang"
  fi

  remainder=$(($1%7))
  if [ $remainder = 0 ]
    then
      message+="Plong"
  fi

  if [ "$message" != "" ]
    then
      echo "$message"
    else
      echo "$1"
  fi
}

drippidydrop "$@"