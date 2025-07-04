# home-assistance-arm

this script is to handle and walkaround for hyper-v unable to boot haos without secure boot

enviroment setup required QEMU for Windows ARM (use Chocolatey or other method to install from powershell)
all QEMU virtualization required item

there are three working files

1) start_haos-2g.bat<br/>
   refering to 2gb ram version that working for very first setup
2) start_haos.bat<br/>
   enhanced to 4gb ram with some tuning, included to use max cpu instead
3) start_haos.ps1<br/>
   base on 4gb version, converted to powershell script

for HAOS please use **aarch64** version with the image type **qcow2**

boot is done when the console output
> 
> Welcome to Home Assistant<br/>
> homeassistant login:
>

access to http://localhost:8123/ to verify

if unable to reach localhost, please use **root** and check the **ha core status**
