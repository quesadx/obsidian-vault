---
tags: [recurso, linux, x86_64]
moc: "[[moc-linux]]"
created: 25-02-2026
updated: 06-03-2026
---

2026-01-21 18:53

Status:

Tags: [[GNOME]] [[Linux]] [[CachyOS]]

# CachyOS GNOME Setup

gsettings set org.gnome.desktop.default-applications.terminal exec 'kgx'

## Extensions

Alphabetical App Grid
AppIndicator and KStatusNotifierItem Support (sin x11 support)
Auto Accent Colour
Caffeine
Coverflow Alt-Tab
Fullscreen to EmptyWorkspace (fork en mi GitHub)
Grand Theft Focus
Hide Top Bar
Impatience
Luminus
Fullscreen Hot Corner
Clipboard History
Top bar organizer



## Software
flatpak
code-insiders
zen-browser

## Snapshots
sudo pacman -S snapper 
sudo snapper -c root create-config /
sudo vim /etc/snapper/configs/root (revisar que esté agregado en ALLOW_USERS)

sudo systemctl enable --now snapper-cleanup.timer
sudo systemctl enable --now snapper-boot.timer

CLEANUP_ALGORITHM="timeline"
TIMELINE_LIMIT_HOURLY="5"
TIMELINE_LIMIT_DAILY="5"
TIMELINE_LIMIT_WEEKLY="2"
TIMELINE_LIMIT_MONTHLY="2"
TIMELINE_LIMIT_YEARLY="0"






# References