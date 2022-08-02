#!/bin/bash -v
#### Change the ssh port number
perl -pi -e 's/^#?Port 22$/Port 6522/' /etc/ssh/sshd_config
service sshd restart || service ssh restart