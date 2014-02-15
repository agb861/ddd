Readme.txt for BSP for NXP LPC2478 start project.
This project was built for Keil MDK V3.23a and
has been tested with V3.23a .

Supported hardware:
===================
The sample project for the NXP LPC2478 CPU
is prepared to run on an Embedded Artists LPC2478 eval board,
but may be used on other target hardware as well.

Using different target hardware may require modifications.

Configurations
==============
- Debug_FLASH_J-Link:
  This configuration is prepared for debugging and
  can be downloaded into internal FLASH using the
  KEIL MDK flashloader and J-Link.
  A call of Debug_FLASH_J-Link.ini ensures that FLASH is mapped at 0x00.

- Release_FLASH_J-Link:
  This configuration is prepared to build a "release"
  output which can be downloaded into FLASH
  using the KEIL MDK flashloader and J-Link.
  A call of Release_FLASH.ini ensures that FLASH
  is mapped at 0x00.
  Contains no debug information.

- Debug_FLASH_ULINK:
  This configuration is prepared for debugging and
  can be downloaded into internal FLASH using the
  KEIL MDK flashloader and KEIL ULINK.
  A call of Debug_FLASH_ULINK.ini ensures that FLASH is mapped at 0x00.

- Release_FLASH_ULINK:
  This configuration is prepared to build a "release"
  output which can be downloaded into FLASH
  using the KEIL MDK flashloader and KEIL ULINK.
  A call of Release_FLASH.ini ensures that FLASH
  is mapped at 0x00.
  Contains no debug information.

Notes:
- GUI & USB
  - Due to harware limitation it is not possible to use USB together with
    the LCD display.

Included middleware components:
===============================
- emFile V3
  - (2.00.01) emFile FAT (supporting FAT12, FAT16 and FAT32)
  - (2.10.10) emFile FAT LFN Module (support for Long File Name)
  - Device drivers:
    - (2.10.03) emFile device driver for MultiMedia/SDcard
    - (2.10.04) emFile device driver for NOR flashes

- emWin V5
  - (3.00.01) emWin BASIC color
  - (3.01.00) emWin WM/Widgets (window manager and widgets)
  - (3.01.02) emWin Memory devices (memory devices for flicker-free animation)
  - (3.01.03) emWin Antialiasing (antialiasing smoothes curves and diagonal lines)
  - (3.01.04) emWin VNC server
  - Drivers:
    - (3.10.02) emWin LCDLin (supported color depths: 1, 2, 4, 8, 15, 16, 32 bpp)

- embOS/IP
  - (7.01.00) embOS/IP (TCP/IP Protocol Stack including: IPv4, ARP, ICMP, UDP, TCP, DHCPc and BSD 4.4 Socket Interface)
  - (7.05.00) embOS-IP HTTPs (Hyper Text Transfer Protocol (Server))
  - (7.02.00) embOS-IP FTPs (File Transfer Protocol (Server))
  - Drivers:
    - (7.01.05) embOS/IP LPC 23/24xx (embOS/IP driver for LPC 23/24xx integrated ethernet controllers)

- embOS V3
  - (1.08.01.08) embOS-ARM7/9-KEIL-SOL (embOS designed for ARM7/9 and KEIL compiler, single developer object license (SOL))

- emUSB V2
  - (9.00.00) emUSB Core (USB core component)
  - (9.00.01) emUSB Bulk component (bulk component + Windows driver (binary))
  - (9.00.03) emUSB MSD component
    - (9.00.05) emUSB MSD-CDROM component
  - (9.00.04) emUSB CDC component
  - (9.00.06) emUSB HID component
  - Drivers:
    - (9.10.14) emUSB target driver LPC24xx (target driver for NXP LPC24xx)
