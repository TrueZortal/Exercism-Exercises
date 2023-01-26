#!/usr/bin/env bash

acronymator () {
  acronym=""
  cleansed=${1//[^[:alnum:].\']/ }
  for word in $cleansed
  do
    acronym+=${word:0:1}
  done
  echo ${acronym^^}
}

acronymator "$@"