2026-01-26 23:43

Status:

Tags: [[CachyOS]] [[Hyprland]] [[Linux]] [[dotfiles]]

# CachyOS Hyprland Minimal Setup

## SSH
### HOST
sudo ufw allow 22/tcp

## Software
fuzzel
python-gobject
cpio
cmake
bluetui
pulsemixer
pcmanfm
swaync
cliphist
wl-clipboard
grim
slurp

## Debloat
octopi

## Plugins
hyprpm update
hyprpm add https://github.com/hyprpm/hyprland-plugins
hyprpm enable hyprexpo
hyprpm reload

swaybgexec-once = swaybg -i /home/youruser/Pictures/wallpaper.png -m fill

bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"











# References