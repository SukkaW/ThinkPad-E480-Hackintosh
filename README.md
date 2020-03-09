<div align="center">
<img src="https://img.skk.moe/2020/02/01/15deff1c-62cc-45b9-aac2-2f6bb9a4350b.jpg" width="350px">
</div>

# ThinkPad E480 Hackintosh

macOS Catalina on ThinkPad E480 (Hackintosh).

Tested on:

- 10.15.2
- 10.15.3
- 10.15.4 Public Beta 1
- 10.15.4 Public Beta 2
- 10.15.4 Public Beta 3
- 10.15.4 Developer Beta 4

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
| Sound Card | Conexant CX20753/4 (layout-id: 15) |
| Wireless Card | Manually change to BCM94352Z (DM1560) |

## What is working

#### CPU

XCPM power management is native supported. HWP is fully enabled as well.

#### Battery

The power display is functioning normally.

#### Wi-Fi

The OEM wireless model is `Realtek 8821CE Wireless LAN 802.11ac PCI-E NIC`. Suggest replacing it with BCM94352Z (DM1560).

> BCM94350ZAE (DW1820A) might work with disabled pins. Not recommended.

#### USB

USB Ports Patching with HackinTool, `5 Gbps` for USB 3.0 (Dev Speed).

#### Ethernet

Functioning normally.

#### Display

The model of Integrated Graphics is `Intel UHD Graphics 620`, faked to `Intel HD Graphics 620`. VRAM has been set to 3072 MB.

The Discrete Graphics' name is `Radeon (TM) RX 550 (2GB)`. Disabled because macOS doesn't support Optimus technology.

The HDMI is attached with `Intel UHD Graphics 620` and is functioning normally. `2K@60Hz` & `4K@30Hz` are supported.

#### Audio

Driven by AppleALC with `layout-id: 15`. Everything is working normally.

#### Keyboard

Functioning normally except the <kbd>Insert</kbd> key, which is not presented on Magic Keyboard. Keyboard backlight is working properly as well.

#### SSD

Both NVMe & SATA are functioning normally and TRIM is enabled for both of them.

#### Bluetooth

Functioning normally.

#### Trackpad & Trackpoint

Functioning normally. Trackpoint and UltraNavs are working properly as well.

## What is not working

<kbd>Fn</kbd> shortcut might stop working after wake from sleep. It is a common bug happened among ThinkPad E470, E480 E490, E570, E580, E590, etc.

## Recommended BIOS Config

> Make sure you have disabled Windows login password before entering the BIOS, because you might not be able to login with "PIN" on Windows after configuring your BIOS as following.

- Security
  - Intel SGX: Disabled
- Boot
  - Boot Mode: Both UEFI and Legacy
  - Boot Priority: UEFI First
  - Fast Boot: Disabled

## Tips

### Hibernation

Hibernation is supported.

### Audio Issue

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
