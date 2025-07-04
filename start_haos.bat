@echo off
set QEMU_PATH=C:\Program Files (x86)\qemu
set IMAGE_PATH=C:\Users\Surface ProX\Downloads\haos_generic-aarch64-15.2.qcow2\haos_generic-aarch64-15.2.qcow2
set EFI_CODE=C:\Program Files (x86)\qemu\share\edk2-aarch64-code.fd
set EFI_VARS=C:\Program Files (x86)\qemu\share\edk2-arm-vars.fd

"%QEMU_PATH%\qemu-system-aarch64.exe" ^
-machine virt,accel=tcg,highmem=on ^
-cpu cortex-a72 ^
-m 4096 ^
-bios "%EFI_CODE%" ^
-drive if=none,file="%IMAGE_PATH%",format=qcow2,id=hd ^
-device virtio-blk-device,drive=hd ^
-netdev user,id=net0,hostfwd=tcp::8123-:8123 ^
-device virtio-net-device,netdev=net0 ^
-nographic