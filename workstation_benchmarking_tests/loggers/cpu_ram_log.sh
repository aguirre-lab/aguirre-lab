#!/bin/zsh

# Log CPU and RAM stats
INIT_DATE=$(date "+%H:%M:%S_%d-%m-%y")

while true; do
  {
    top -b -n 1 | head -n 39
    echo
  } >> "./result_logs/cpu_ram_stats_$INIT_DATE.log"
  sleep 0.5
done
