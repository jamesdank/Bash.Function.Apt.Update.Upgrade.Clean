#!/bin/bash

#####################################################################
# Sound Files
UPDATE="/home/$USER/apt.update.upgrade.clean/mp3/update.mp3"
UPGRADE="/home/$USER/apt.update.upgrade.clean/mp3/upgrade.mp3"
CLEAN="/home/$USER/apt.update.upgrade.clean/mp3/clean.mp3"
READY="/home/$USER/apt.update.upgrade.clean/mp3/ready.mp3"
#####################################################################

if ! command -v ffplay &> /dev/null
then
    echo "ffplay could not be found"
    exit 0
fi

echo -e "\nUpdating system..." 
ffplay $UPDATE -autoexit -nodisp 2> /dev/null 
sleep 2 
sudo apt update -y 

echo -e "\nUpgrading system..." 
ffplay $UPGRADE -autoexit -nodisp 2> /dev/null 
sleep 2 
sudo apt upgrade -y 
        
echo -e "\ncleaning up update files and purging unused packages..." 
ffplay $CLEAN -autoexit -nodisp 2> /dev/null 
sleep 2 
sudo apt clean -y 
sudo apt autoremove -y
ffplay $READY -autoexit -nodisp 2> /dev/null 
