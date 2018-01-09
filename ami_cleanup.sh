#!/usr/bin/env bash
# This script cleans up your EC2 instance before baking a new AMI.
# This script was modified, original avalable here https://gist.github.com/justindowning/5921369/raw/ami-clean.sh

function print_green {
  echo -e "\e[32m${1}\e[0m"
}

function print_red {
  echo -e "\e[31m${1}\e[0m"
}

running_as_root() {
	if [[ $EUID > 0 ]]; then
  	print_red "Please run as root/sudo"
  	exit 1
	fi
}

running_as_root

print_green "Clean Apt"
apt-get -y autoremove
apt clean
apt autoclean

print_green "Clean Codefresh Working Dir"
rm -rf /opt/codefresh

print_green "Remove SSH keys"
[ -f /home/ubuntu/.ssh/authorized_keys ] && rm /home/ubuntu/.ssh/authorized_keys

print_green "Cleanup log files"
find /var/log -type f | while read f; do echo -ne '' > $f; done

print_green "Cleanup bash history"
unset HISTFILE
[ -f /root/.bash_history ] && rm /root/.bash_history
[ -f /home/${USER}/.bash_history ] && rm /home/${USER}/.bash_history

print_red "After disconnect this instance will be unavailable, you just removed all ssh keys!\n"
print_green "Now run this:"
print_green "history -c && exit\n"
print_green "AMI cleanup complete! Now you can create new image!\n"

