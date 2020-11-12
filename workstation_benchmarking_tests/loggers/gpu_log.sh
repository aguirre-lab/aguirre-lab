#!/bin/zsh

# Log GPU stats
INIT_DATE=$(date "+%H:%M:%S_%d-%m-%y")
nvidia-smi --query-gpu=timestamp,name,pci.bus_id,driver_version,pstate,count,fan.speed,temperature.gpu,temperature.memory,utilization.gpu,utilization.memory,memory.total,memory.free,memory.used,power.management,power.draw,power.limit \
--format=csv -l 1 -f "./result_logs/gpu_stats_$INIT_DATE.csv"
