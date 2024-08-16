#!/bin/bash

[[ -z ./grub ]] && echo "Grub Config File doesn't exist." && exit 1

# Naive script. Saves the default file as a backup then copies my version across
# Expect this to fail if a backup has already been made
mv /etc/default/grub /etc/default/grub.bk
cp ./grub /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg
