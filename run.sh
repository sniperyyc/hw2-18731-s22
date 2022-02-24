# CMU 18731 HW2
# Code referenced from: git@bitbucket.org:huangty/cs144_bufferbloat.git
# Edited by: SOOJIN MOON, Deepti Sunder Prakash

#!/bin/bash
echo "Start shrew experiment"
sudo sysctl -w net.ipv4.tcp_congestion_control=reno
sudo sysctl -w net.ipv4.tcp_min_tso_segs=1
python dumbbell.py --bw-host 0 \
                --bw-net 0 \
                --delay 0 \
                --n 1 \
		--maxq 0

echo "cleaning up..."
killall -9 iperf ping
mn -c > /dev/null 2>&1
echo "end"
