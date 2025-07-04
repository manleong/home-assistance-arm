$QEMU_PATH = "C:\Program Files (x86)\qemu"
$IMAGE_PATH = "C:\Users\Surface ProX\Downloads\haos_generic-aarch64-15.2.qcow2\haos_generic-aarch64-15.2.qcow2"
$EFI_CODE = "$QEMU_PATH\share\edk2-aarch64-code.fd"
$EFI_VARS = "C:\Users\Surface ProX\qemu_nvram.fd"

if (-Not (Test-Path $EFI_VARS)) {
    Copy-Item "$QEMU_PATH\share\edk2-arm-vars.fd" -Destination $EFI_VARS
}

Start-Process -FilePath "$QEMU_PATH\qemu-system-aarch64.exe" -ArgumentList @(
    "-machine", "virt,accel=tcg,highmem=on,gic-version=3",
    "-cpu", "cortex-a72",
    "-m", "4096",
    "-smp", "2",
    "-drive", "if=pflash,file=$EFI_CODE,format=raw,readonly=on",
    "-drive", "if=pflash,file=$EFI_VARS,format=raw",
    "-drive", "if=none,file=$IMAGE_PATH,format=qcow2,id=hd",
    "-device", "virtio-blk-device,drive=hd",
    "-netdev", "user,id=net0,hostfwd=tcp::8123-:8123",
    "-device", "virtio-net-device,netdev=net0",
    "-nographic"
) -NoNewWindow -Wait
