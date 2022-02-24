# CMU 18731 HW2
# Code referenced from:git@bitbucket.org:huangty/cs144_bufferbloat.git
# Edited by: Soo-Jin Moon, Deepti Sunder Prakash

if [ $# -ne 1 ]
then
    echo "Usage: `basename $0` {experiment_name}"
exit
fi

exp=$1

# Change the -i argument based on your network configuration to plot the bandwidth of hl1, hl2 and a1.
# You can additionally plot bandwidth of other hosts as well in the similar way.
python plot_rate.py -f ${exp}_bw.txt -o ${exp}_hl1_bw.png --xlabel time-100units=1sec --ylabel bandwidth-Mbps -i s1-eth1
python plot_rate.py -f ${exp}_bw.txt -o ${exp}_hl2_bw.png --xlabel time-100units=1sec --ylabel bandwidth-Mbps -i s1-eth2
python plot_rate.py -f ${exp}_bw.txt -o ${exp}_a1_bw.png --xlabel time-100units=1sec --ylabel bandwidth-Mbps -i s1-eth3
python plot_tcpprobe.py -f ${exp}_tcpprobe.txt -o ${exp}_tcp_cwnd_iperf1.png -p 5001 >/dev/null
python plot_tcpprobe.py -f ${exp}_tcpprobe.txt -o ${exp}_tcp_cwnd_iperf2.png -p 5002 >/dev/null
#python plot_tcpprobe.py -f ${exp}_tcpprobe.txt -o ${exp}_tcp_cwnd_wget.png -p 80 --sport >/dev/null


echo "Use xdg-open to see figures"
echo "Figure Names"
echo "Bandwidth-hl1 : ${exp}_hl1_bw.png"
echo "Bandwidth-hr1 : ${exp}_hr1_bw.png"
echo "Bandwidth-hr1 : ${exp}_a1_bw.png"
echo "Congestion-hr1 : ${exp}_tcp_cwnd_iperf1.png"
echo "Congestion-hr2 : ${exp}_tcp_cwnd_iperf2.png"

