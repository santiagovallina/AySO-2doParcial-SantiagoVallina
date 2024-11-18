(crear particiones)
sudo fdisk /dev/sdc
n
p
1
+1g

sudo fdisk /dev/sdc
n
p
2
+1g

sudo fdisk /dev/sdc
n
p
3
+1g

sudo fdisk /dev/sdc
n
e
4
+3g

sudo fdisk /dev/sdc
n
5
+1.5g

sudo fdisk /dev/sdc
n
6
+1.3g

(particion 1 como swap)
sudo fdisk /dev/sdc
t
1
82

sudo mkswap /dev/sdc1
sudo swapon /dev/sdc1

(crear PV)
sudo fdisk /dev/sdc
t
2
8E

sudo fdisk /dev/sdc
t
3
8E

sudo fdisk /dev/sdc
t
5
8E

sudo fdisk /dev/sdc
t
6
8E

(volumen fisico en cada particion)
sudo pvcreate /dev/sdc2 /dev/sdc3 /dev/sdc5 /dev/sdc6

(volumen group)
sudo vgcreate vgAdmin /dev/sdc2 /dev/sdc3
sudo vgcreate vgDevelopers /dev/sdc5 /dev/sdc6

(volumen logico)
sudo lvcreate -L 1G vgDevelopers -n lvDevelopers
sudo lvcreate -L 1G vgDevelopers -n lvTesters
sudo lvcreate -L .8G vgDevelopers -n lvDevops
sudo lvcreate -L 1.5G vgAdmin -n lvAdmin

(formatear y montar)
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvDevelopers
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvTesters
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvDevops
sudo mkfs.ext4 /dev/mapper/vgAdmin-lvAdmin

sudo mkdir /mnt/lvDevelopers
sudo mkdir /mnt/lvTesters
sudo mkdir /mnt/lvDevops
sudo mkdir /mnt/lvAdmin

sudo mount /dev/mapper/vgDevelopers-lvDevelopers /mnt/lvDevelopers
sudo mount /dev/mapper/vgDevelopers-lvTesters /mnt/lvTesters
sudo mount /dev/mapper/vgDevelopers-lvDevops /mnt/lvDevops
sudo mount /dev/mapper/vgAdmin-lvAdmin /mnt/lvAdmin
