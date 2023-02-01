#!/usr/bin/env bash

errorhandler () {
  if [[ $# == 1 ]]
  then
    echo "Hello, $1"
  else
    echo "Usage: error_handling.sh <person>"
    exit 66
  fi
}

errorhandler "$@"