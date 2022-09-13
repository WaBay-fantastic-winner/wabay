#!/bin/bash

echo ==========================
echo    Local Rails Launcher
echo            ----
echo
echo  Getting local IP Address
echo --------------------------
echo

# Get the local IP address
# LOCAL_IP=$(ifconfig wifi0 | grep inet | grep -v inet6 | awk '{print $2}')
LOCAL_IP=$(ifconfig en0 | grep inet | grep -v inet6 | awk '{print $2}')

echo $LOCAL_IP
echo
echo --------------------------
echo      Launching Rails
echo            ----
echo

# Set the default rails port
RAILS_PORT=3000

if [ "$1" = "port" ];then
    RAILS_PORT=$2
			echo
				echo  Using custom port
					echo --------------------------
			echo
				echo $RAILS_PORT
					echo
						echo --------------------------
fi

echo  Rails will be at
echo --------------------------
echo
echo http://$LOCAL_IP:$RAILS_PORT
echo
# read -p "Press [Enter] to launch rails..."

bundle exec rails s -b $LOCAL_IP -p $RAILS_PORT