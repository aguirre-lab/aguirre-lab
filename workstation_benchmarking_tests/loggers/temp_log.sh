#!/bin/zsh

# Log CPU temperature
INIT_DATE=$(date "+%H:%M:%S_%d-%m-%y")

while true; do
  {
    date "+%H:%M:%S   %d/%m/%y"
    sensors
  } >> "./result_logs/cpu_temp_$INIT_DATE.log"
  sleep 0.5
done
