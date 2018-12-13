#!/bin/bash

while [ 1 ]; do /usr/bin/ssh -C -o ConnectTimeout=5 -o ConnectionAttempts=300 -o ServerAliveInterval=30 -o ServerAliveCountMax=3 -o UserKnownHostsfile=/dev/null -o StrictHostKeyChecking=no -i /home/<some-user>/.ssh/id_dsa -p <some-weird-ssh-port> -R 2889:localhost:22 <some-user>@<your-home-IP-address> -N; done &

