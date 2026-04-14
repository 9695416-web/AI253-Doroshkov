#!/bin/bash
# Налаштування шляху до VirtualBox
export PATH=$PATH:"/c/Program Files/Oracle/VirtualBox"

# 1. Реєстрація ВМ
VBoxManage createvm --name "Linux of Doroshkov" --ostype Ubuntu_64 --register

# 2. Установка ресурсів
VBoxManage modifyvm "Linux of Doroshkov" --cpus 1 --memory 513 --graphicscontroller vboxvga --vram 128

# 3. Настройка мережі
VBoxManage modifyvm "Linux of Doroshkov" --nic1 nat
VBoxManage modifyvm "Linux of Doroshkov" --natpf1 "SSH,tcp,127.0.0.1,1234,10.0.2.15,22"

# 4. Створення контролерів
VBoxManage storagectl "Linux of Doroshkov" --name "SATA Controller" --add sata --controller IntelAHCI
VBoxManage storagectl "Linux of Doroshkov" --name "IDE Controller" --add ide --controller PIIX4

# 5. Створення диска
VBoxManage createmedium disk --filename "DiskDoroshkov.vdi" --size 3795 --format VDI

# 6. Підключення носіїв
VBoxManage storageattach "Linux of Doroshkov" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "DiskDoroshkov.vdi"
VBoxManage storageattach "Linux of Doroshkov" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium "C:/Users/Admin/Downloads/ubuntu-14.04.6-server-amd64.iso"

echo "Скрипт налаштування завершено."
