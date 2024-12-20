#!/bin/bash

sudo apt update && apt upgrade -y
sudo apt install git python3 python3-pip npmsudo golang 
git clone https://github.com/mitre/caldera.git --recursive
cd caldera
python3 -m venv .
sudo ./bin/pip3 install -r requirements.txt
sudo ./bin/pip3 install docker setuputils
./bin/python3 server.py --build
