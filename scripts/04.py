#!/bin/python3
import sys
import os
import subprocess as spr
from termcolor import colored, cprint

cases = {
    '1': ['01', "In what file can you find the installed version of your Debian?"],
    '2': ['02', "What command can you use to rename your system?"],
    '3': ['03', "What file has to be modified to make it permanent?"],
    '4': ['04', "What command gives you the time since your system was last booted?"],
    '5': ['05', "Name the command that determines the state of the SSH service."],
    '6': ['06', "Name the command that reboots the SSH service."],
    '7': ['07', "Figure out the PID of the SSHD service."],
    '8': ['08', "What file contains the RSA keys of systems that are authorized to connect via SSH?"],
    '9': ['09', "What command lets you know who is connected to the System?"],
    '0': ['10', "Name the command that lists the partition tables of drives?"],
    'w': ['11', "Name the command that displays the available space left and used on the system in an humanly understandable way"],
    'e': ['12', "Figure out the exact size of each folder of /var in a humanly understandable way followed by the path of it."],
    'r': ['13', "Name the command that find, in real time, currently running processes"],
    't': ['14', "Run the ‘tail -f /var/log/syslog‘ command in background"],
    'y': ['15', "Find the command that kills the background command’s process"],
    'u': ['16', "Find the service which makes it possible to run specific tasks following a regular schedule"],
    'i': ['17', "Find the command that allows you to connect via ssh on the VM.(In parallel with the graphic session)"],
    'o': ['18', "Find the command that kills ssh service"],
    'p': ['19', "List all services which are started at boot time and name this kind of services"],
    'a': ['20', "List all existing users on the VM"],
    's': ['21', "List all real users on the VM"],
    'd': ['22', "Find the command that add a new local user"],
    'f': ['23', "Explain how connect yourself as new user. (With graphic session and ssh session)"],
    'g': ['24', "Find the command that list all packages"]
}

clear = lambda: os.system('clear')

def getch():
    import termios
    import sys, tty
    def _getch():
        fd = sys.stdin.fileno()
        old_settings = termios.tcgetattr(fd)
        try:
            tty.setraw(fd)
            ch = sys.stdin.read(1)
        finally:
            termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)
        return ch
    return _getch()

    print("\nselect task or press q for quit")

def     system_scripts(name, description):
    cprint("system {}".format(name), 'yellow', attrs=['bold'])
    cprint("task: " + description, 'green')
    print()
    cprint("file {} content:".format(name), 'cyan')
    p = spr.Popen("cat ../system/{}".format(name), shell=True)
    p.wait()
    print()
    cprint("Result of execute:", 'magenta')
    cprint("sh ../system/{}".format(name), 'magenta', attrs=['bold'])
    p = spr.Popen("sh ../system/{}".format(name), shell=True)
    p.wait()
    print("\npress any key")
    getch()

def     sort_func(symbol):
    try:
        string = "1234567890wertyuiopasdfghjkl"
        return string.index(symbol)
    except:
        print(symbol, symbol, symbol)

def     menu():
    cprint("\nMENU SYSTEM:", color='red')
    keys_cases = list(cases.keys())
    keys_cases.sort(key=sort_func)
    for i in keys_cases:
        print("{}. system {}. ".format(i, cases[i][0]), end="")
        cprint("{}".format(cases[i][1]), color="green")
    print("q. Exit")
    print("\npress key for start system_tasks or q for quit")

#menu()

while (True):
    clear()
    menu()
    char = getch()
    try:
        name, descr = cases.get(char)
        clear()
        # p = spr.Popen("clear", shell=True)
        # p.wait()
        system_scripts(name, descr)
    except:
        pass
    if char == 'q':
        break
