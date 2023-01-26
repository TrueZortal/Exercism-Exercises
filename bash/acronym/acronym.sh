#!/usr/bin/env bash

acronymator () {
  acronym=""
  cleansed=${1//[^[:alnum:].\']/ }
  for word in $cleansed
  do
    if [[ "$word" != "$word" ]]
      then
        for cleanword in $word
        do
          acronym+=${cleanword:0:1}
        done
      else
        acronym+=${word:0:1}
    fi
    done


  echo ${acronym^^}
}

acronymator "$@"