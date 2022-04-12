# Bedroom 🛏️


## Prepare the hardware 🧰

Be sure to call the following hardware your own:

* Temporary, i.e. only for setup:
	* A computer to run the [Rasperry Pi Imager](https://www.raspberrypi.org/downloads/) software
	* ...with a mouse, keyboard, display, etc.
	* ...with an SD card reader
* Permanent, i.e. dedicated to the Ras Pi:
	* 1x Raspberry Pi 🥧 *(here: Raspberry Pi 3, Model B, 1GB RAM)*
	* 1x Micro SD card *(here: SanDisk Ultra 32GB)*
	* 1x Power supply, Raspberry Pi-compatible 🔌 *(here: Official Micro USB Power Supply)*
	* 1x Ethernet cable; WiFi access is alternatively possible, but won't be covered here


## Prepare the software, pt. 1 🦙 1️⃣

1. Connect the Micro SD card to the computer
2. Download, install, and run **Raspberry Pi Imager**:
	* Tested with v1.7.2 on Windows
	* Choose OS: **Raspberry Pi OS (32-bit)**
	* Write to the Micro SD card
2. Eject the Micro SD card from the computer
2. Insert the Micro SD card into the Ras Pi, connect the ethernet cable, connect the power supply; the Ras Pi will automatically start


## Prepare the software, pt. 2 🦙 2️⃣

1. Go through the initial setup of the operating system
2. Clone _this_ repository:
	1. Run `mkdir -p ~/GitHub/IanStorm/`
	2. Run `cd ~/GitHub/IanStorm/`
	2. Run `git clone https://github.com/IanStorm/my-home-raspi.git`
2. Run `crontab -e`, select `/bin/nano` as your editor, exit via <kbd>CTRL</kbd>+<kbd>X</kbd>
2. Run `crontab -e`, then jump to the end of the file via <kbd>CTRL</kbd>+<kbd>END</kbd>, and append the following content:
```sh
# my-home-raspi
@reboot cd /home/<USERNAME>/GitHub/IanStorm/my-home-raspi/ && git pull
```
*
	* Do not forget to replace `<USERNAME>`
	* Exit via <kbd>CTRL</kbd>+<kbd>X</kbd>, then <kbd>y</kbd>, and finally <kbd>Enter</kbd>
