#!/bin/bash
# class_lab.sh - Part I: The Challenges (Commands)

# Processes & Daemons

# 1) List all running processes associated with nginx
ps aux | grep nginx

# 2) Kill all processes named my_script.sh (no PID lookup)
pkill -f my_script.sh

# 3) Run backup.sh in background and keep running after logout
nohup ./backup.sh &

# 4) Extract only the PID of sshd
pidof sshd

# 5) View processes in a tree format (parent/child)
pstree -p

# 6) List all files opened by process PID 1234
lsof -p 1234

# 7) Check if docker daemon is active (systemd)
systemctl is-active docker

# 8) Start heavy_calc.sh with lowest CPU priority (highest niceness)
nice -n 19 ./heavy_calc.sh


# Files, Copying & Archiving

# 9) Copy /var/www/html to /backup/html recursively
cp -r /var/www/html /backup/html

# 10) Copy secret.key to /tmp preserving timestamps, ownership, permissions
cp -a secret.key /tmp/

# 11) rsync src/ to dest/ (only newer or missing in dest)
rsync -au src/ dest/

# 12) cp from dir1 to dir2 only if source is newer
cp -u dir1/* dir2/

# 13) Copy local app.conf to /etc/ on remote server using scp
scp app.conf user@192.168.1.50:/etc/

# 14) Create a .tar.gz archive of /var/log
tar -czf var-log.tar.gz /var/log


# The find Command

# 15) Find files in /home larger than 500MB
find /home -type f -size +500M

# 16) Find files in /var/log modified in last 7 days
find /var/log -type f -mtime -7

# 17) Find files in /tmp owned by user jenkins
find /tmp -type f -user jenkins

# 18) Find empty directories in /data and delete them
find /data -type d -empty -delete

# 19) Find files in current directory with 777 permissions
find . -maxdepth 1 -type f -perm 777

# 20) Find .jpg files in current folder and copy them to /images/
find . -maxdepth 1 -type f -name "*.jpg" -exec cp {} /images/ \;


# Regular Expressions (Grep, Sed, Awk)

# 21) Extract valid email addresses from contacts.txt
grep -Eo '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}' contacts.txt

# 22) Case-insensitive search for "error" in syslog
grep -i "error" syslog

# 23) Find lines in config.ini that start with "root"
grep -E '^root' config.ini

# 24) Show lines in access.log that do NOT contain 192.168.1.1
grep -v "192.168.1.1" access.log

# 25) Search for "TODO" recursively in current directory/subdirectories
grep -R "TODO" .

# 26) Replace localhost with 127.0.0.1 in hosts.txt (in place)
sed -i 's/localhost/127.0.0.1/g' hosts.txt

# 27) View config file without lines starting with #
grep -v '^[[:space:]]*#' config.conf

# 28) Find lines that look like IPv4 addresses (simple format check)
grep -E '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b' file.txt


# Complex Combinations

# 29) List all running processes, filter to only those running as root
ps aux | grep '^root'

# 30) Find *.log files, search for "Critical", print filename if match found
find . -type f -name "*.log" -exec grep -l "Critical" {} \;
