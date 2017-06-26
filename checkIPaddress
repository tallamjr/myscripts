#!/bin/bash

lynx --dump http://ipecho.net/plain > my-ip.txt

mutt -s "Today's IP" $GMAIL < my-ip.txt

rm my-ip.txt
