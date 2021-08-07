#!/bin/sh

# Clear Screen
clear

# Ask for and read Username
read -p "Enter username for GUI install: " user

# Clear Screen
clear

# Update Ports
echo Updating Ports
sleep 3
portsnap fetch
clear
echo Updated ports recieved, now extracting...
sleep 3
portsnap extract

# Clear Screen
clear

# Install Screen
echo Installing Screen
sleep 3
cd /usr/ports/sysutils/screen
make -DBATCH install clean

# Clear Screen
clear

# Install Nano
echo Installing Nano
sleep 3
cd /usr/ports/editors/nano
make -DBATCH install clean

# Clear Screen
clear

# Install Screenfetch
echo Installing Screenfetch
sleep 3
cd /usr/ports/sysutils/screenfetch
make -DBATCH install clean

# Clear Screen
clear

# Install Xorg
echo Installing Xorg
sleep 3
cd /usr/ports/x11/xorg
make -DBATCH install clean

# Clear Screen
clear

# Install KDE4
echo Installing KDE4
sleep 3
cd /usr/ports/x11/kde4
make -DBATCH install clean

# Clear Screen
clear

# Install Firefox
echo Installing Firefox
sleep 3
cd /usr/ports/www/firefox
make -DBATCH install clean

# Clear Screen
clear

# Add Prerequisites to /etc/rc.conf
echo Adding GUI prerequisites to rc.conf
sleep 3
sysrc dbus_enable="YES"
sysrc hald_enable="YES"

# Clear Screen
clear

# Edit User /.xinitrc
echo Exiting xinitrc of ${user}
sleep 3
cd /home/${user}
echo "exec /usr/local/bin/startkde" >> /.xinitrc

# Clear Screen
clear

# Notify of Finish
echo ALL DONE!
sleep 3

# Clear Screen
clear

# Notify of Reboot
echo Going down for Reboot in 10 seconds...
sleep 10

# Reboot
shutdown -r now
