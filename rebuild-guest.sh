#!/bin/sh
# Create a `nixos` subdirectory of the user's home dir
limactl shell nixos -- mkdir -p /home/${USER}.guest/nixos
# rsync the current directory into the  ~/nixos directory in the guest
limactl copy --backend=rsync . nixos:/home/${USER}.guest/nixos
# Rebuild the guest using Determinate Nix
limactl shell --workdir /home/${USER}.guest/nixos nixos -- sudo nixos-rebuild boot --flake .#determinate-aarch64
# Reboot the guest with the rebuilt Nix environment, hostname,etc.
limactl restart nixos


