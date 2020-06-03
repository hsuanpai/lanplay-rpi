#!/bin/sh
#Write by Maruku Lin
#Date:0412_2020
#Update: 0602_2020
#ver:0.0.7
#####################
URL_FILE=/home/pi/url-list.txt
LAN_PLAY_APP=/home/pi/lan-play/lan-play-arm64

KILL() {
RUN=$(ps aux|grep -i lan-play|grep pmtu|awk '{print $2}')
sudo kill -9 $RUN &> /dev/null
}

STOP_CLIENT_ANCH(){
RUN=$(ps aux|grep -i lan-play|grep pmtu|awk '{print $2}')
sudo kill -9 $RUN &> /dev/null
}

ANCH15_S1() {
#S1
sudo $LAN_PLAY_APP --fake-internet --pmtu 500 --relay-server-addr 114.32.216.13:11451 &
}
ANCH15_S6() {
#S6
sudo $LAN_PLAY_APP --fake-internet --pmtu 500 --relay-server-addr 114.32.216.13:11456 &
}
ANCH15_SLPTW() {
sudo $LAN_PLAY_APP --fake-internet --pmtu 500 --relay-server-addr switchlanplay-tw.ddns.net:11451 &
}

LP_STATUS() {
sudo ps aux|grep -i "lan-play\|slp-server-rust" | grep -iv grep
}

##[ Main ]##

case $1 in
S1|s1)
  KILL
  ANCH15_S1
  ;;
S6|s6)
  KILL
  ANCH15_S6
  ;;
SLPTW|slptw)
  KILL
  ANCH15_SLPTW
  ;;
status)
  LP_STATUS
  ;;
stop-client|stop)
  STOP_CLIENT_ANCH
  ;;  
*)
  echo "Script Usage:( $0 S1 & / $0 S6 / $0 slp-tw &)."
  echo "S1 : for ANCH connect to lanplay.cpalm.org:11451"
  echo "S6 : for ANCH connect to lanplay.cpalm.org:11456"
  echo "slptw : for ANCH connect to switchlanplay-tw.ddns.net:11451"
  echo "status : for LanPlay-Rpi & Server check."
  echo "stop-client: for Stop Client for ANCH"
  exit
  ;;
  
esac





