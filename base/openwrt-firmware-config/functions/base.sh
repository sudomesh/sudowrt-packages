#!/bin/sh

# Takes a message string as an argument and logs with script name
log() {

  if [ -z "$LOG_TAG" ]
  then
    LOG_TAG=$0
  fi

  logger -t "$LOG_TAG" "$1"
}
