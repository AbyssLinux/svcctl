# svcctl

A minimal wrapper around runit for Void Linux. Provides service management commands (enable, disable, start, stop, restart) and log viewing for runit services. Features a declarative profile system for managing service configurations across different system roles (server, workstation, etc.), with automatic application of sysctl, SSH, and firewall settings.

This can be used on any Void system, but it is meant to be part of the Abyss project.

## Installation

```sh
sudo make install
```

For uninstallation:

```sh
sudo make uninstall
```

## Usage

See `svcctl(1)` for complete documentation and examples.
