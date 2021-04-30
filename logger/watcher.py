import os
import time
import subprocess
import select
import datetime
import signal


def exitScript():
    global is_running
    is_running = False
    purgeFireWall()


def banIp(ip):
    subprocess.call(f"iptables -A INPUT -s {ip} -j DROP", shell=True)
    print(f"{ip} is banned!")


def purgeFireWall():
    subprocess.call(f"iptables -F", shell=True)
    print("\nyou are no longer protected and the ip have been purged")


domain_name = input('Enter your domain name: ')

log_file = subprocess.Popen(["tail", "-F", '/var/log/apache2/access.log'],
                            stdout=subprocess.PIPE, stderr=subprocess.PIPE)
poll = select.poll()

poll.register(log_file.stdout)

while True:
    if poll.poll(1):
        signal.signal(signal.SIGTERM, exitScript)
        log = log_file.stdout.readline().decode("utf-8").replace('"', " ").split(" ")
        os.system("sh fail2ban.sh -d "+domain_name)
