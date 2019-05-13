#!/bin/bash

cd /usr/share/metasploit-framework
pwd
patch -p1 -i /root/Labs/msf_patch/ftp.patch
