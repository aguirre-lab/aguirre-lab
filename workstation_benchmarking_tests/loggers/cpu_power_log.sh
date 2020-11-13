#!/bin/zsh

# Log CPU power draw
INIT_DATE=$(date "+%H:%M:%S_%d-%m-%y")

while true; do
  {
    date "+%H:%M:%S   %d/%m/%y"
    "./power_meas_tool/cpu_power_meas" | tail -n 10
    echo
  } >> "./result_logs/cpu_power_$INIT_DATE.log"
  sleep 0.5
done
