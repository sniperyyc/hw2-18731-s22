# CMU 18731 HW2
# Code referenced from:git@bitbucket.org:huangty/cs144_bufferbloat.git
# Edited by: Deepti Sunder Prakash. Soo-Jin Moon

from time import sleep, time
from subprocess import *
import re

default_dir = '.'

def monitor_devs_ng(fname="%s/bw.txt" % default_dir, interval_sec=1):
    """Uses bwm-ng tool to collect iface tx rate stats.  Very reliable."""
    cmd = ("sleep 1; bwm-ng -t %s -o csv "
           "-u bits -T rate -C ',' > %s" %
           (interval_sec * 1000, fname))
    Popen(cmd, shell=True).wait()

