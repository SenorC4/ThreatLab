#!/bin/bash
#Used to install mitre caldera 5.0.0 on ubuntu 24.04.1 

sudo apt update && apt upgrade -y
sudo apt install git python3 python3-pip npm golang 
git clone https://github.com/mitre/caldera.git --recursive
cd caldera
python3 -m venv .
sudo ./bin/pip3 install docker setuputils
sudo ./bin/pip3 install -r requirements.txt
./bin/python3 server.py --build
