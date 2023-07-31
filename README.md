# openwrt-device-scanner
Scans for new devices in network and sends telegram notification if a new device is detected

## Dependencies

- fish
- nmap

## Setup

Insert your bot token and chatid in the telegram function.  
Edit subnets to be scanned.  
Create /root/db directory where the log files will be stored.  
Enter your OpenWRT web-ui > System > Scheduled Tasks and add a task to run the script. Here's an example:  
```
0 * * * * /root/script.sh > /root/script.log 2>&1
```
