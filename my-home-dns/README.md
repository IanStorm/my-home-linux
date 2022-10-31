# my-home-dns

[⬅ Back](../README.md)


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
	* 1x Ethernet cable; WiFi access is possible, but won't be covered here


## Prepare the Operating System (OS)

1. Connect the Micro SD card to the computer
2. Download, install, and run **Raspberry Pi Imager**:
	1. Choose OS: Raspberry Pi OS (other) ➡️ **Raspberry Pi OS Lite (32-bit)**
	2. Select the Micro SD card as storage
	2. Click on "⚙️" (i.e. "Advanced options")
		1. Check "Set username and password"
		2. Set a username, e.g. `pi`
		2. Set a password
	2. Write to the Micro SD card
	* Tested with v1.7.3 on Windows
2. Clone this repository.
2. Configure:
	1. Eject and re-insert the SD card
	2. Copy all items from the cloned `SD_card/` folder to the root folder of the drive called **"boot"**
2. Eject the Micro SD card from the computer
2. Insert the Micro SD card into the Ras Pi, connect all cables/devices, and finally start the Ras Pi


## Prepare the environment, pt. 1 🌍 1️⃣

1. Register the Ras Pi with proper settings in your router:
	1. Assign a host name, e.g. *"my-home-dns"*
	2. Assign a static IP address, e.g. `192.168.178.10`
2. Initially connect via SSH: `ssh pi@my-home-dns`
	* There will be a prompt to add the fingerprint, type `yes`
	1. Set host name: `sudo hostnamectl set-hostname my-home-dns`
	2. Close the SSH connection


## Prepare the software 🦙

1. Run setup script: `ssh pi@my-home-dns 'bash -s' < ./setup.sh`<br>
	Then wait for the automatic restart.
2. Connect (again) via SSH:
	1. Auto-install security-relevant updates, select "Yes" during the setup: `sudo dpkg-reconfigure --priority=low unattended-upgrades`
	2. Configure _crontab_:
		1. Run `crontab -e`, select `/bin/nano` as your editor, exit via <kbd>CTRL</kbd>+<kbd>X</kbd>
		2. Configure an output handler: Run `sudo apt update && sudo apt install -y postfix`, select "Local only" during the setup
		2. Run `crontab -e`, then jump to the end of the file via <kbd>CTRL</kbd>+<kbd>END</kbd>, and append the following content:
```sh
# Auto-start `my-home-raspi` on each boot
@reboot sleep 30s && cd /home/pi/GitHub/IanStorm/my-home-raspi/ && git reset --hard && git pull
@reboot sleep 45s && /opt/IanStorm/my-home-raspi/on_booted.sh
# Auto-update `my-home-raspi` daily at 3:00am
0 3 * * * /opt/IanStorm/my-home-raspi/update.sh
```
*
	*
		4. Exit via <kbd>CTRL</kbd>+<kbd>X</kbd>, then <kbd>y</kbd>, and finally <kbd>Enter</kbd>
		* ☝ _crontab_ logs are found at `/var/mail/pi`
	3. Restart the Ras Pi: `sudo reboot`


## Prepare the environment, pt. 2 🌍 2️⃣

1. Register the Ras Pi as DNS in your router


## Appendix


### Sources 📙

* [Raspberry Pi OS: No default username and password anymore (2022-04)](https://www.raspberrypi.com/news/raspberry-pi-bullseye-update-april-2022/)
