# nixos-lima-determinate-sample

A sample NixOS configuration flake that uses the [nixos-lima](https://github.com/nixos-lima/nixos-lima) module to enable running Determinate NixOS within a [Lima](https://lima-vm.io)-managed VM on macOS.

This repository can be used as a template for your custom NixOS Lima VM configuration. Because it references the `nixos-lima` module, you should be able to update to new and improved versions while maintaining the configuration of your VM separately/privately.
   
 The sample BASH scripts `setup-nixos.sh` is used to check out a Git repository for your local NixOS system configuration and to build/switch to that configuration. This mechanism allows you to configure and manage a Determinate NixOS Lima VM and track changes in a Git repository.

This example uses the latest base image release from [nixos-lima](https://github.com/nixos-lima/nixos-lima).

## Prerequisites

* macOS 13.5+ or recent Linux with Lima installed

NOTE: Nix is not needed to run a NixOS Lima VM (e.g. you can install Lima with Homebrew or another mechanism)

## Installation

Check out this repository to your Lima host. The following commands can be used with no customization of this repository. (The main username for the guest VM, "lima" is hardcoded in `homeConfigurations."lima"` in `flake.nix`.)

```
limactl start --yes --memory 12 github:nixos-lima
```

You can then log in to your NixOS guest VM using:

```
limactl shell nixos
```

To do a `nixos-rebuild` of the guest and switch to Determinate Nix, use:

```
 ./rebuild-guest.sh 
```

## Help Wanted

Feedback, issues, and pull-requests are all most welcome.
