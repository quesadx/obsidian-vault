---
tags: [recurso]
created: 25-02-2026
updated: 06-03-2026
---

2026-01-30 16:13

Status:

Tags: [[NixOS]] [[Linux]] [[dotfiles]] [[home-manager]]
# NixOS Learning Guide
NixOS is declarative: instead of running commands like ```` bash sudo apt install vim ````, you declare what your system should look like in the config files. Then, Nix builds that exact same declared state.

## File Structure

| File              | Purpose                                                               |
| ----------------- | --------------------------------------------------------------------- |
| flake.nix         | The "entry point". Defines dependencies and ties everything togheter. |
| configuration.nix | System-wide settings (bootloader, users, packages, etc.)              |
| home.nix          | User-specific apps, dotfiles and shell tools for the user (quesadx).  |
### flake.nix
* **inputs**: Where your configs gets its packages/tools from.
	* nixpkgs: The main Nix package repository.
	* home-manager: A tool to manage user-level configs (sharing the same nixpkgs version)
* **outputs**: Defines what this flake produces.
	* nixosConfigurations.nixos: A complete NixOS system named "NixOS".
	* modules: Combines your configuration.nix (system) + Home Manager setup (user).

#### What Is A Flake?
A self-contained, reproducible Nix project with explicit dependencies, well-defined outputs and no global state.

Flake makes your config self-contained. Anyone can clone your dotfiles repo and run:
```bash 
nixos-rebuild switch --flake .#nixos
```
to get my exact setup.
### configuration.nix
This file configures the OS itself. 

```nix 
{ config, pkgs, ...}: { ... }
```

* The `{ config, pkgs, ...}` part gives me access to:
	* config: Current system config (for conditional logic)
	* pkgs: all available pack
This base configuration allows to set up core system features, like networking, bootloaders, environment system packages (system-wide ones), services/daemons, fonts and nix-specific settings.
### home.nix
Handles user-apps and dotfiles. Not system settings.
* home.username/homeDirectory: Links the config to your user account.
* home.packages: User-specific tools, like kitty, fastfetch, fuzzel, etc.

Also covers app-specific configs:
* programs.chromium: installs chromium + set extensions
* ...

## Why?
* System packages [[#configuration.nix]] require sudo to install.
* User packages [[#home.nix]] install into the home directory. No sudo needed.
This keeps the personal setup portable and clean across machines.

## Flow
![[Pasted image 20260130165553.png]]

## Nix Language Basics (Brief)
N@home.nix)ix is a purely functional, lazy declarative language.
* Everything is an expression that evaluates to a value.
* No side effects: You describe what you want, not how to do it.
* Functions are everywhere: Everythhing is literally a function.

In my config `{ config, pkgs, ... }: { ... }` is a function that takes an argument (a set/record) containing config, pkgs, etc., and returns a configuration attribute set (like a JSON object).

## Nix Store
Is a special directory located by default in `/nix/store`. Contains every file ever build or installed by nix, organized in a unique way.

### Properties
* Immutable: Once something is in the store, it never changes.
* Content-addressed: Every item has a name that includes a cryptographic hash of everything that affects it (sources, dependencies, build scripts, etc.).
* Isolated: Each package/version lives in its own directory. No shared `/usr/bin` or `/lib`.

#### Per-item
All items look like `/nix/store/<hash>-<name>`

**Nix dynamically links everything after switching.**

# References