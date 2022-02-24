# CMU 18731 HW2
# Code referenced from:git@bitbucket.org:huangty/cs144_bufferbloat.git
# Edited by: Deepti Sunder Prakash, Soo-Jin Moon

#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Usage: `basename $0` {experiment_name}"
exit
fi

exp=$1
sudo python exp_monitor.py -e ${exp}
