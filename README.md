<div align="center">
<img src="https://img.skk.moe/2020/02/01/15deff1c-62cc-45b9-aac2-2f6bb9a4350b.jpg" width="350px">
</div>

# ThinkPad E480 Hackintosh

macOS Catalina on ThinkPad E480 (Hackintosh).

## Disclaimer

Your warranty is now void. Please do some research if you have any concerns before replacing your EFI with mine. I am not responsible for any loss, including but not limited to Kernel Panic, device fail to boot or can not function normally, storage damage or data loss, atomic bombing, World War III, The CK-Class Restructuring Scenario that SCP Foundation can not prevent, and so on.

## Devices

| Specifications | Details |
|:---|:---|
| Computer Model | ThinkPad E480 (2018) |
| CPU | Intel Core i7-8550U |
| Memory | DDR4 2400 Mhz. Manually upgrade to 2x16 GB |
| NVMe SSD | Manually change to Lenovo SL700 M.2 512 GB |
| SATA SSD | Manually change to Toshiba TR200 SATA 512 GB |
| Integrated Graphics | Intel UHD Graphics 620 |
| Discrete Graphics | Radeon (TM) RX 550 (2 GB) |
| Ethernet | RTL8168/8111/8112 Gigabit Ethernet Controller |
| Sound Card | Conexant CX20753/4 (layout-id: 3 or 15) |
| Wireless Card | Manually change to BCM94352Z (DM1560) |

## What is working

#### CPU

XCPM power management is native supported. HWP is fully enabled as well.

#### Battery

The power display is functioning normally.

#### Wi-Fi

The OEM wireless model is `Realtek 8821CE Wireless LAN 802.11ac PCI-E NIC`. Suggest using BCM94352Z (DM1560).

> BCM94350ZAE (DW1820A) might work with disabled pins.

#### USB

Functioning normally. Hackintools shows `5 Gbps` for USB 3.0 (Dev Speed).

#### Ethernet

Functioning normally.

#### Built-in display

The model of Integrated Graphics is `Intel UHD Graphics 620`, faked to `Intel HD Graphics 620`. The Discrete Graphics' name is `Radeon (TM) RX 550 (2GB)`. Disabled because macOS doesn't support Optimus technology.

#### Audio

Driven by AppleALC. Everything is working normally.

#### Keyboard

Functioning normally except the <kbd>Insert</kbd> key. Keyboard backlight is working as well.

#### SSD

Functioning normally and TRIM is supported.

#### Bluetooth

Functioning normally.

#### Trackpad

Functioning normally. Trackpoint and buttons are working properly as well.

> Driven by [Modified VoodooPS2Controller by RehabMan](https://github.com/RehabMan/OS-X-Voodoo-PS2-Controller)

## What is not working

Brightness control from keyboard is not working. Install [Brightness Slider](https://apps.apple.com/us/app/brightness-slider/id456624497) from AppStore instead.

## Recommended BIOS Config

> Make sure you have disabled Windows login password before entering the BIOS, because you might not be able to login with "PIN" on Windows after configuring your BIOS as following.

- Security
  - Intel SGX: Disabled
- Boot
  - Boot Mode: Both UEFI and Legacy
  - Boot Priority: UEFI First
  - Fast Boot: Disabled
- Exit
  - OS Optimized Defaults: Disabled

## Tips

### Hibernation

Be aware that hibernation (suspend to disk or S4 sleep) is not supported with hackintosh. You should disable it with other hibernation related options:

```bash
sudo pmset -a hibernatemode 0
sudo pmset -a standby 0
sudo pmset -a autopoweroff 0
sudo rm /var/vm/sleepimage
sudo mkdir /var/vm/sleepimage
```

Always check your hibernatemode after updates and disable it. System updates tend to re-enable it, although the trick above (making sleepimage a directory) tends to help.

### Power Management

If you have faced some strange issue (like audio device is not found) after booting from Windows to macOS, you should reboot back to Windows and has a cold reboot (shutdown then start up) back to macOS. After that your audio device should be back.

> If you are using Parallel Desktop with Boot Camp mode on your hacintosh, you should not reboot directly in macOS for the same reason. You should manually shutdown Windows in Parallel Desktop, and then have your macOS cold rebooted (shutdown then start up).

### Windows Time Fix

Run following command with Administrator privileges in CMD:

```
Reg add HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation /v RealTimeIsUniversal /t REG_DWORD /d 1
```

This will force Windows treat Hadware Time as UTC Time.

## Maintainer

**ThinkPad E480 Hackintosh** © [Sukka](https://github.com/SukkaW). All right reserved.<br>

> [Personal Website](https://skk.moe) · [Blog](https://blog.skk.moe) · GitHub [@SukkaW](https://github.com/SukkaW) · Telegram Channel [@SukkaChannel](https://t.me/SukkaChannel) · Twitter [@isukkaw](https://twitter.com/isukkaw) · Keybase [@sukka](https://keybase.io/sukka)
