#!/bin/sh

depends="/usr/share/sudomesh/base.sh /usr/share/libubox/jshn.sh"

for file in $depends; do
  if [ -f "$file" ] 
  then
    . "$file"
  else
    log "$file does not exist. wireless.sh functions depend on it"
    exit 2
  fi
done

local wifi_up

pollRadio() {
  local radio
  local status
  radio="$1"

  log "Checking wireless radio $radio status"
  status=$(ubus call network.wireless status)
  json_load "$status"
  json_select "$radio"
  json_get_var wifi_up up
  log "$radio status $wifi_up"

}

# Waits for wifi to be ready
# First parameter should be quoted name of radio or list of radios
# eg: "radio0 radio1"
# Second parameter is optional timeout in seconds
# examples:
# waitForWifi "radio0" 10
# waitForWifi "radio0 radio1"
# waitForWifi
waitForWifi() {

  local timeout
  local elapsed_time
  local default_timeout
  local radios
  local sleep_time
  local status

  sleep_time=3
  default_timeout=60


  if type json_load | grep -q 'function$' 2>/dev/null; then
    true
  else
    log 'json_load does not exist - cannot use waitForWifi without it'
    exit 2
  fi
    
  elapsed_time=0

  if [ -z "$2" ] 
  then
    timeout="$default_timeout"
  else
    timeout="$2"
  fi
  log "timeout=$timeout"

  if [ -n "$1" ]
  then
    radios=$1
  else
    status=$(ubus call network.wireless status)
    json_load "$status"
    json_get_keys radios

    while [ -z "$radios" ] ; do
      log "No radio loaded yet"
      status=$(ubus call network.wireless status)
      json_load "$status"
      json_get_keys radios
      sleep $sleep_time
      elapsed_time=$(expr "$elapsed_time" + "$sleep_time") 
      log "elapsed_time=$elapsed_time"
    done
  log "Radio is loaded: $radios"
  fi

  for radio in $radios; do

    radio=$(echo "$radio" | tr -d ' ')
    pollRadio "$radio"

    while [ "$wifi_up" != 1 ]; do
      if [ "$elapsed_time" -gt "$timeout" ]
      then
        exit 1
      fi

      pollRadio "$radio"
      sleep $sleep_time
      elapsed_time=$(expr "$elapsed_time" + "$sleep_time") 
      log "elapsed_time=$elapsed_time"

    done
  done
}


