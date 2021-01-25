#!/bin/bash
echo "Starting mfbot, a Docker image by Cilix"

cd /var/opt/mfbot/webinterface
python3 MainProgram.py &
cd /var/opt/mfbot   
./MFBot_Konsole_x86_64
