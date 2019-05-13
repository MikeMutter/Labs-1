#!/bin/bash

cd /usr/share/metasploit-framework
pwd
patch -p1 -i ./ftp.patch
