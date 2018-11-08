# Phone-Home-SSH
Use this to make a continuous SSH tunnel you can use to access a remote machine
while [ 1 ]; do /usr/bin/ssh -C -o ConnectTimeout=5 -o ConnectionAttempts=300 -o ServerAliveInterval=30 -o ServerAliveCountMax=3 -o UserKnownHostsfile=/dev/null -o StrictHostKeyChecking=no -i /home/<some-user>/.ssh/id_dsa -p <some-weird-ssh-port> -R 2889:localhost:22 <some-user>@<your-home-IP-address> -N; done &

This will continuously make a connection home.  The parameters are as follows:
<some-user> - The user you will use to make this connection.  It's a good idea to use a unique username for this action
<your-home-IP-address> - The public IP of the machine you have access to.  This script is installed on the machine at the remote site, typically behind a firewall or using an ISP that changes their public IP address all the time.
<some-weird-ssh-port> - use something besides port 22 to avoid password-guessing attacks.  It's also a good idea to disable password authentication completely when doing this.  Public-private key pairs are the way to go!!

Once the connection is made you can use this command to connect to the host on the other end:
ssh -p 2889 <user>@127.0.0.1
