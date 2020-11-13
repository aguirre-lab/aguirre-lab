#!/bin/zsh
echo "Installing tests and dependencies for benchmarking the workstation..."
sudo apt install stress
apt-cache search lm-sensors && update
sudo apt install lm-sensors && sudo sensors-detect
git clone https://github.com/djselbeck/rapl-read-ryzen.git
mkdir power_meas_tool
gcc -o ./power_meas_tool/cpu_power_meas ./rapl-read-ryzen/ryzen.c -lm
rm -rf rapl-read-ryzen
echo -e "Does this workstation have gpu? (yes/no)"
read -r answer
if [ "$answer" = "yes" ] || [ "$answer" = "y" ]; then
  git clone https://github.com/wilicc/gpu-burn gpu_test
  cd gpu_test || return
  sed -i '1s_.*_CUDAPATH=/usr_' Makefile
  make
  cp ./compare.ptx ../
  cd ..
fi
