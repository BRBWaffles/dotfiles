#!/usr/bin/env bash

cp /etc/nixos/configuration.nix /etc/nixos/configuration.nix.backup

sed -i '/services\.printing\.enable = true;/a\  nix.settings.experimental-features = ["nix-command" "flakes"];\n  services.openssh.enable = true;' /etc/nixos/configuration.nix
sed -i '/thunderbird/a\      git\n      vscode\n      tomb' /etc/nixos/configuration.nix
swapoff -a

echo "/etc/nixos/configuration.nix updated successfully."