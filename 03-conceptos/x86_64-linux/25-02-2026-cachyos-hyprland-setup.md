---
tags: [recurso, linux, x86_64]
moc: "[[moc-linux]]"
created: 25-02-2026
updated: 06-03-2026
---

2026-01-13 02:13

Status:

Tags: [[Arch]] [[Linux]] [[Hyprland]] [[CachyOS]] [[dotfiles]]

# CachyOS Hyprland Setup


zen-browser-bin
hyprpolkitagent
waybar
pulsemixer
brightnessctl
battop
lf
hyprmon-bin
swww
bluetui
wlogout
swappy
swaync
grim
slurp
wl-clipboard
cliphist
wlogout
fuzzel
stow
tree

sudo cachyos-rate-mirrors
sudo pacman -Syyu

sudo systemctl disable sddm gdm lightdm ly greetd --now

xdg-settings set default-web-browser zen-browser.desktop


### Remove plymouth from HOOKS
sudo nano /etc/mkinitcpio.conf
HOOKS=(base udev autodetect modconf kms plymouth filesystems fsck)

ls /boot/loader/entries/
sudo nano /boot/loader/entries/cachyos-linux-regular.conf
### Remove splash
options root=UUID=... rw quiet splash loglevel=3 ...

sudo rm -f /etc/systemd/system/plymouth*
sudo systemctl daemon-reload

### Remove systemd 5s timeout
sudo nano /boot/loader/loader.conf

sudo pacman -R cachyos-plymouth-bootanimation
sudo pacman -R plymouth

sudo pacman -R dunst cachyos-hello cachyos-fish-config cachyos-zsh-config

?
sudo systemctl disable --now ananicy-cpp

## SSH git

ssh-keygen -t ed25519 -C "tu-email@ejemplo.com"
cat ~/.ssh/id_ed25519.pub
# References