#!/bin/bash

# Pacman optimisations
sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/g' /etc/pacman.conf
pacman -Syyu reflector rsync curl wget xorg networkmanager sudo vim git
reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# Continue
timedatectl set-timezone Asia/Kolkata
sed -i 's/#en_IN/en_IN/' /etc/locale.gen
locale-gen
echo LANG=en_IN.UTF-8 > /etc/locale.conf
export LANG=en_IN.UTF-8
echo rohanbatra > /etc/hostname
touch /etc/hosts
echo "127.0.0.1	localhost" >> /etc/hosts
echo "::1		localhost" >> /etc/hosts
echo "127.0.1.1	rohanbatra" >> /etc/hosts
echo "Please set your root password"
passwd
useradd -m rohan
usermod -aG wheel rohan
echo "Please set your user password"
passwd rohan
EDITOR=vim
systemctl enable NetworkManager.service

# editing sudo
vim /etc/sudoers


# directory mounting
mkdir /mnt/rohan
mkdir /mnt/rohan/git-repos


# All dot files should linked using symlinks from /git-repos
 


# appending home to arch
for i in $(blkid|grep sda4); do echo $1 /mnt/rohan ext4 defaults 0 1 ; done | grep -w UUID | sed "s/\"//g" > new

# appending it to fstab
cat new >> /etc/fstab

# fetching GitHub repos

cd /mnt/rohan/git-repos
git clone https://gitHub.com/rohanbatrain/dot-files


# links
ln -sf 

