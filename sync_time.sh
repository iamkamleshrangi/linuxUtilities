ntpdate -s ntp.ubuntu.com
sudo apt-get install ntp
sudo service ntp stop
sudo ntpdate -s time.nist.gov
sudo service ntp start
