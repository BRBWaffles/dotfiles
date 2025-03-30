#!/usr/bin/env bash

mkdir -p /var/lib/sops-nix
mkdir -p /home/nick/.config/sops/age

cp /run/media/nick/crypt/key.txt /home/nick/.config/sops/age/keys.txt
cp /run/media/nick/crypt/key.txt /var/lib/sops-nix/key.txt

swapon -a

echo "SOPS keys transferred successfully."