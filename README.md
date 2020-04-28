# lanplay-rpi
Step 1：

cd /home/pi
vim .bashrc
copy below lines and paste into .bashrc
`
#Add by Maruku Lin
echo "======================================================"
echo "You have 10 Seconds to stop Server to HIT [ CTRL + C ]"
echo "======================================================"
sleep 10
#Port : 11456
/home/pi/cpalm-rust-srv.sh &
echo "======================================================"
echo "You have 10 Secends to STOP CLIENT to HIT [ CTRL + C ]"
echo "Lan-Play default is connect to port 11456"
echo "======================================================"
sleep 10
#Deafult connect to port 11452
/home/pi/lanplay-rpi.sh lp-cpalm &
`
save & exit the .bashrc
