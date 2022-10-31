# HTPC Bedroom 🛏️

[⬅ Back](../README.md)


## Prepare the hardware 🧰

Be sure to call the following hardware your own:

* Temporary, i.e. only for setup:
	* A computer to run the [Rasperry Pi Imager](https://www.raspberrypi.org/downloads/) software
	* ...with a mouse, keyboard, display, etc.
	* ...with an SD card reader
* Permanent, i.e. dedicated to the Ras Pi:
	* 1x Raspberry Pi 🥧 *(here: Raspberry Pi 4, Model B, 4GB RAM)*
	* 1x Micro SD card *(here: SanDisk Ultra 128GB)*
	* 1x Power supply, Raspberry Pi-compatible 🔌 *(here: Official USB-C Power Supply)*
	* 1x Case, Raspberry Pi-compatible *(here: Argon One V2)*
	* 1x Ethernet cable; WiFi access is possible, but won't be covered here
	* 1x Monitor *(here: Samsung T27A750)*
	* 1x HDMI cable
	* 1x Keyboard and mouse ⌨️🖱️ *(here: Logitech K400+)*


## Prepare the Operating System (OS)

1. Connect the Micro SD card to the computer
2. Download, install, and run **Raspberry Pi Imager**:
	1. Choose OS: Raspberry Pi OS (other) ➡ **Raspberry Pi OS (64-bit)**
	2. Write to the Micro SD card
	* Tested with v1.7.2 on Windows
2. Clone this repository.
2. Configure:
	1. Eject and re-insert the SD card
	2. Copy all items from the cloned `SD_card/` folder to the root folder of the drive called **"boot"**
2. Eject the Micro SD card from the computer
2. Insert the Micro SD card into the Ras Pi, connect all cables/devices, and finally start the Ras Pi


## Setup the OS

1. Go through the initial setup of the operating system
2. Set keyboard layout:
	1. _Applications Menu_ ➡ _Preferences_ ➡ _Keyboard and Mouse_
	2. _Keyboard and Mouse Settings_ window ➡ _Keyboard_ tab ➡ _Keyboard Layout…_ button ➡ Select the layout
2. Rename computer:
	1. _Applications Menu_ ➡ _Preferences_ ➡ _Raspberry Pi Configuration_
	2. _Raspberry Pi Configuration_ window ➡ _System_ tabs ➡ Set _Hostname_ to `htpc_bedroom`
	2. Reboot
2. Disable screen timeout:
	1. _Applications Menu_ ➡ _Preferences_ ➡ _Raspberry Pi Configuration_
	2. _Raspberry Pi Configuration_ window ➡ _Display_ tab ➡ Set _Screen Blanking_ to _Disable_
	2. Reboot
2. Set UI scaling:
	1. _Applications Menu_ ➡ _Preferences_ ➡ _Appearance Settings_
	2. _Appearance Settings_ window ➡ _Defaults_ tabs ➡ _Set Defaults_ button next to _For large screens_
2. _Panel Preferences_ window ➡ _Panel Applets_ tab ➡ Add and configure _Resource monitors_


## Prepare the software, pt. 1 🦙 1️⃣

⚠️ Keep in mind to replace `<USERNAME>` with the actual user name in the below commands.

1. Clone _this_ repository:
	1. Run `mkdir -p ~/GitHub/IanStorm/`
	2. Run `cd ~/GitHub/IanStorm/`
	2. Run `git clone https://github.com/IanStorm/my-home-raspi.git`
2. Map cloned folder:
	1. Run `sudo mkdir -p /opt/IanStorm/`
	2. Run `sudo ln --symbolic /home/<USERNAME>/GitHub/IanStorm/my-home-raspi/htpc_bedroom/opt/IanStorm/my-home-raspi/ /opt/IanStorm/`
2. Configure _crontab_:
	1. Run `crontab -e`, select `/bin/nano` as your editor, exit via <kbd>CTRL</kbd>+<kbd>X</kbd>
	2. Configure an output handler: Run `sudo apt update && sudo apt install -y postfix`, select "Local only" during the setup
	2. Run `crontab -e`, select `/bin/nano` as your editor, then jump to the end of the file via <kbd>CTRL</kbd>+<kbd>END</kbd>, and append the following content:
```sh
# my-home-raspi
@reboot sleep 30s && cd /home/<USERNAME>/GitHub/IanStorm/my-home-raspi/ && git reset --hard && git pull
@reboot sleep 45s && /opt/IanStorm/my-home-raspi/on_booted.sh
0,30 * * * * sleep 50s && /opt/IanStorm/my-home-raspi/every_30m.sh
```
*
	4. Exit via <kbd>CTRL</kbd>+<kbd>X</kbd>, then <kbd>y</kbd>, and finally <kbd>Enter</kbd>
	* ☝ _crontab_ logs are found at `/var/mail/<USERNAME>`


## Prepare the software, pt. 2 🦙 2️⃣

1. Add _Argone One_ software: Run `curl https://download.argon40.com/argon1.sh | bash`
2. Configure _Chromium_:
	1. Enable DRM compatibility:
		1. Run `sudo apt update && sudo apt install -y chromium-browser:armhf`
		2. Run `sudo apt update && sudo apt install -y libwidevinecdm0`
	2. Use dark theme
	2. Install the [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm) extension
2. Add _GShutdown_:
	1. [Download](http://ports.ubuntu.com/pool/universe/g/gshutdown/gshutdown_0.2-0ubuntu9_arm64.deb) and install the `.deb` package; see https://pkgs.org/download/gshutdown and https://github.com/Asher256/gshutdown
	2. Set custom commands:
		* Turn off the computer: `shutdown`
		* Restart computer: `reboot`
2. Add _Netflix_:
	1. Login to Netflix
	2. Create a _Chromium_ shortcut for `https://netflix.com/browse`
2. Add _OneDrive_:
	1. Run `curl -L https://raw.github.com/pageauc/rclone4pi/master/rclone-install.sh | bash`
	2. Run `rclone config`, create a new remote called `onedrive`
	2. Go through the setup
	* ☝ OneDrive sync is done via _crontab_
2. Add _Soolar_, the unofficial Logitech software:
	1. Run `sudo apt install -y solaar`
	2. Unplug and plug the Logitech USB connector
2. Add _Spotify_:
	1. Install the `https://open.spotify.com` Progressive Web App (PWA)
	2. Login to Spotify
2. Configure _VLC_
2. Add _YouTube_:
	1. Login to YouTube
	2. Install the `https://youtube.com` PWA
	2. Set dark theme as preferred theme
	2. Settings ➡ Playback and performance ➡ Disable inline playback
2. Auto-install security-relevant updates:
	1. Run `sudo apt update && sudo apt install -y unattended-upgrades`
	2. Run `sudo dpkg-reconfigure --priority=low unattended-upgrades`, select "Yes" during the setup


## Appendix


### Sources 📙

* https://www.electromaker.io/tutorial/blog/how-to-stream-netflix-on-raspberry-pi
* https://github.com/raspberrypi/Raspberry-Pi-OS-64bit/issues/172#issuecomment-1123462739
* https://jarrodstech.net/how-to-raspberry-pi-onedrive-sync/
* https://support.parsec.app/hc/en-us/articles/115002699012-Setting-Up-On-Raspberry-Pi-Raspbian-
* https://www.blog.berrybase.de/blog/2022/02/23/den-raspberry-pi-absichern/
* https://raspberrypi.stackexchange.com/a/133214
* https://raspberrypi.stackexchange.com/a/125105
