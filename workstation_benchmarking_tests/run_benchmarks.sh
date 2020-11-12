#!/bin/zsh

# Script to run benchmarks for RAM, CPU and GPU
echo -e "Choose what test you want to run (ram, cpu, gpu or all):"
read -r type_benchmark
if [ "$type_benchmark" = "cpu" ] || [ "$type_benchmark" = "gpu" ] || [ "$type_benchmark" = "all" ]; then
  echo -e "For how much time do you want to run the tests (in seconds)?"
  read -r time
fi
sudo modprobe msr
mkdir result_logs

# Start log recording
sudo ./loggers/cpu_power_log.sh &
./loggers/cpu_ram_log.sh &
./loggers/temp_log.sh &
./loggers/gpu_log.sh &

if [ "$type_benchmark" = "ram" ]; then
  echo "Running RAM test..."
  # Start test
  python3 ./own_tests/ram_test.py

elif [ "$type_benchmark" = "cpu" ]; then
  echo "Running CPU test..."
  # Start test
  stress --cpu 16 --io 16 --timeout "$time"s

elif [ "$type_benchmark" = "gpu" ]; then
  echo "Running GPU test..."
  # Start test
  ./gpu_test/gpu_burn "$time"

elif [ "$type_benchmark" = "all" ]; then
  echo "Running all tests simultanoeusly..."
  # Start test
  stress --cpu 16 --io 16 --timeout "$time"s &
  ./gpu_test/gpu_burn "$time"

else
  echo "Wrong test name. Availabe are: ram, cpu, gpu or all"
fi

# Get log PIDs
cpu_ram_pid=$(pgrep cpu_ram_log)
temp_pid=$(pgrep temp_log)
cpu_power_pid=$(pgrep cpu_power_log)
gpu_pid=$(pgrep gpu_log)
echo "Ending processes..."
# Kill processes
sudo kill -9 $cpu_power_pid
kill -9 $cpu_ram_pid $temp_pid $gpu_pid
