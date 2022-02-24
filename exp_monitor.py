# CMU 18731 HW2
# Code referenced from:git@bitbucket.org:huangty/cs144_bufferbloat.git
# Edited by: Deepti Sunder Prakash, Soo-Jin Moon
# code is further edited by looking at : https://bitbucket.org/huangty/cs144_bufferbloat/src


from monitor import monitor_devs_ng

from subprocess import Popen, PIPE
from time import sleep, time
from multiprocessing import Process
from argparse import ArgumentParser

import sys
import os

parser = ArgumentParser(description="Throughput Monitor")
parser.add_argument('--exp', '-e',
                    dest="exp",
                    action="store",
                    help="Name of the Experiment",                                                       required=True)
# Expt parameters
args = parser.parse_args()

def start_tcpprobe():
    "Install tcp_pobe module and dump to file"
    os.system("(rmmod tcp_probe >/dev/null 2>&1); modprobe tcp_probe full=1;")
    print "Monitoring TCP CWND ... will save it to ./%s_tcpprobe.txt " % args.exp
    Popen("cat /proc/net/tcpprobe > ./%s_tcpprobe.txt" %
        args.exp, shell=True)

def bwmon():
    monitor = Process(target=monitor_devs_ng,args=('%s_bw.txt' % args.exp, 0.01 ))
    monitor.start()
    print "Monitoring Throughput ... will save it to %s_bw.txt " % args.exp
    raw_input('Press Enter key to stop the monitor--> ')
    monitor.terminate()

if __name__ == '__main__':
    start_tcpprobe()
    bwmon()
    Popen("killall -9 bwm-ng", shell=True).wait()
