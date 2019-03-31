#!/bin/bash
sudo mount -o remount,rw /
#Install Required Software
wget https://github.com/juribeparada/MMDVM_HS/releases/download/v1.4.16/mmdvm_hs_hat_fw.bin
# DV-Mega Mods
sudo killall MMDVMHost >/dev/null 2>&1
sudo systemctl stop mmdvmhost.timer
sudo systemctl stop mmdvmhost.service
sudo stm32flash -v -w mmdvm_hs_hat_fw.bin -g 0x0 -R -i 23,-22,22:-23,22 /dev/ttyAMA0 
sudo systemctl start mmdvmhost.timer
sudo systemctl restart mmdvmhost.service
sudo rm mmdvm_hs_hat_fw.bin
sudo rm update.sh
sudo mount -o remount,ro /
