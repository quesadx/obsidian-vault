2026-01-17 18:10

Status: #Alpha

Tags: [[Linux]] [[NixOS]] [[nmtui]] [[fdisk]] [[dotfiles]]

# NixOS Setup

## Red
Inicio utilizando [[nmtui]] para red.

## Disco
sudo [[fdisk]] /dev/diskX para iniciar el proces de formateo del disco. Siguiendo los comandos, en orden:
### Crear particiones

```` bash
g
n
1
2048
+500M # (y en caso de que salga una confimación de firma antigua de vfat)
t
1 # (EFI)
n
2
default (fill up partition)
default (fill up partition)
w
````

Ahora, se recarga la tabla de particiones con:

```` bash
sudo partprobe /dev/sda.
udevadm settle
````

Eliminar firmas antiguas para evitar errores:

```` bash
sudo wipefs -a /dev/sda1
sudo wipefs -a /dev/sda2
````

### Labels

Ahora, se proceden a colocar los labels, que resultan para manejar de forma más sencilla las particiones a futuro, donde /dev/sda1 o /dev/sda2 corresponden a las particiones 1 y 2 que creamos en el disco:

```` bash
sudo mkfs.fat -F32 -n NIXBOOT /dev/sda1
sudo mkfs.ext4 -L NIXROOT /dev/sda2
````

Y verificar que:
* **Partición 1:** vfat, NIXBOOT
* **Partición 2:** ext4, NIXROOT

```` bash
lsblk -f
ls /dev/disk/by-label
````

### Montar

Y ahora montamos las particiones para poder accederlas e instalar [[NixOS]]:

```` bash
sudo mount /dev/disk/by-label/NIXROOT /mnt
sudo mkdir -p /mnt/boot
sudo mount /dev/disk/by-label/NIXBOOT /mnt/boot
````

### Swap

Lo omito por que voy a usar [[zram]], pero acá los comandos:

```` bash
sudo dd if=/dev/zero of=/mnt/.swapfile bs=1024 count=2097152 # 2GB size
sudo chmod 600 /mnt/.swapfile
sudo mkswap /mnt/.swapfile
sudo swapon /mnt/.swapfile
````

## Generar config

### Desmontar y montar por si acaso
Recomiendo desmontar  y montar todo con:

```` bash
sudo umount -R /mnt

sudo mount /dev/disk/by-label/NIXROOT /mnt
sudo mkdir -p /mnt/boot
sudo mount /dev/disk/by-label/NIXBOOT /mnt/boot
````

Y luego generar la config base con:
```` bash
sudo nixos-generate-config --root /mnt
````

### Editar

Con:

```` bash
sudo -e /mnt/etc/nixos/configuration.nix
````

Recomiendo poner los siguientes valores:


#### Nota: 
Si no por alguna razón puede iniciar sesión, tiene que entrar con la iso mediante el USB live y hacer un passwd usuario después de montar /mnt y /mnt/boot para poder cambiarla. Falta documentar eso


# Setup con video

sudo -i

setfont latarcyrheb-sun32

wipefs -a /dev/sda
sgdisk --zap-all /dev/sda

cfdisk /dev/sda

gpt

1G EFI
El resto en lo default Linux Filesystem

mkfs.ext4 -L nixos /dev/sda2
mkfs.fat -F 32 -n BOOT /dev/sda1

mount /dev/sda2 /mnt
mount --mkdir /dev/sda1 /mnt/boot

nixos-generate-config --root /mnt

cd /mnt/etc/nixos

CONFIGURAR TODO ACÁ

cd /mnt/etc/nixos
### Enable experimental features if not already
export NIX_CONFIG="experimental-features = nix-command flakes"

### Build the system
nix build .#nixosConfigurations.nixos-linux.config.system.build.toplevel

## Flatpak

flatpak remote-add --if-not-exists flathub \ https://flathub.org/repo/flathub.flatpakrepo

# References

