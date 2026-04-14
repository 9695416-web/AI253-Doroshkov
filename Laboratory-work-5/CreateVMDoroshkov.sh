#!/bin/bash
# Скрипт створення віртуальної машини для Лабораторної роботи №5
# Виконав: Дорошков Родіон, група АІ-253

# Додаємо шлях до VirtualBox (для Windows/Git Bash)
export PATH=$PATH:"/c/Program Files/Oracle/VirtualBox"

# 1. Створення та реєстрація ВМ
VBoxManage createvm --name "Linux of Doroshkov" --ostype Ubuntu_64 --register

# 2. Налаштування системних параметрів (RAM: 513MB)
VBoxManage modifyvm "Linux of Doroshkov" --memory 513 --vram 128 --cpus 1 --graphicscontroller vboxvga

# 3. Налаштування мережі NAT з прокиданням порту (SSH: 1234 -> 22)
VBoxManage modifyvm "Linux of Doroshkov" --nic1 nat
VBoxManage modifyvm "Linux of Doroshkov" --natpf1 "SSH,tcp,127.0.0.1,1234,,22"

# 4. Створення контролерів сховища
VBoxManage storagectl "Linux of Doroshkov" --name "SATA Controller" --add sata --controller IntelAHCI
VBoxManage storagectl "Linux of Doroshkov" --name "IDE Controller" --add ide --controller PIIX4

# 5. Створення та підключення диска (Size: 3795MB)
VBoxManage createmedium disk --filename "DiskDoroshkov.vdi" --size 3795 --format VDI
VBoxManage storageattach "Linux of Doroshkov" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "DiskDoroshkov.vdi"

# 6. Підключення інсталяційного образу (ISO)
VBoxManage storageattach "Linux of Doroshkov" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium "C:/Users/Admin/Downloads/ubuntu-14.04.6-server-amd64.iso"

echo "ВМ 'Linux of Doroshkov' успішно сконфігурована."
