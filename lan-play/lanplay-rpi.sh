#!/bin/sh
#Write by Maruku Lin
#Date:0412_2020
#ver:0.0.4
#####################
KILL() {
RUN=$(ps aux|grep -i lan-play|grep pmtu|awk '{print $2}')
sudo kill -9 $RUN &> /dev/null
}

ANCH15() {
#S6
sudo /home/pi/lan-play/lan-play-rpi --fake-internet --pmtu 500 --relay-server-addr 114.32.216.13:11451 &
}
ANCH15_SLP() {
sudo /home/pi/lan-play/lan-play-rpi --fake-internet --pmtu 500 --relay-server-addr switchlanplay-tw.ddns.net:11451 &
}



##[ Main ]##

case $1 in
lp-cpalm)
  KILL
  ANCH15
  ;;
slp-tw)
  KILL
  ANCH15_SLP
  ;;
*)
  echo "Script Usage:( $0 lp-cpalm & / $0 slp-tw &)."
  echo "lp-cpalm for lanplay.cpalm.org:11451"
  echo "slp-tw for connect switchlanplay-tw.ddns.net:11451"
  exit
  ;;
  
esac

