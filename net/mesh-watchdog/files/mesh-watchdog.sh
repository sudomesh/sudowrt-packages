#!/bin/sh

help() {
  cat <<EOF

Usage
$0 IP ping_wait initial_wait num_tries restart_command

IP: IP Address To Ping
ping_wait: Wait specified to ping command (-w flag)
initial_wait: Startup Delay (seconds)
num_tries: Failure Count To Reboot
restart_command: Command that will be run on failure to ping

eg.
$0 100.64.0.1 2 10 10 '/etc/init.d/meshrouting restart'

Borrowed heavily from danitool: https://forum.openwrt.org/viewtopic.php?id=55115
$EXTRA_HELP
EOF
}

if [ "$#" -ne 5 ]; then
  help
  exit 2
fi

dest=$1
ping_wait=$2
initial_wait=$3
num_tries=$4
restart_command=$5

tries=0
sleep $initial_wait

while test "$tries" -lt "$num_tries"; do
  if /bin/ping -c 1 -w "$ping_wait" "$dest" >/dev/null; then
    # ping OK
    tries=0
  else
    # ping KO
    tries=`expr $tries + 1`
  fi
done

# no ping response, no link -> reboot
eval "$restart_command"
