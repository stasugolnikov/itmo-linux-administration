#!/bin/bash

userdel -r u1
userdel -r u2

groupdel g1

rm -rf /home/test13
rm -rf /home/test14
rm -rf /home/test15

rm work3.log

rm /etc/skel/readme.txt
