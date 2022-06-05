# HTPC Bedroom 🛏️


## Prepare the hardware 🧰

Be sure to call the following hardware your own:

* Temporary, i.e. only for setup:
	* A computer to run the [Rasperry Pi Imager](https://www.raspberrypi.org/downloads/) software
	* ...with a mouse, keyboard, display, etc.
	* ...with an SD card reader
* Permanent, i.e. dedicated to the Ras Pi:
	* 1x Raspberry Pi 🥧 *(here: Raspberry Pi 4, Model B, 4GB RAM)*
	* 1x Micro SD card *(here: SanDisk Ultra 128GB)*
	* 1x Power supply, Raspberry Pi-compatible 🔌 *(here: Official Micro USB Power Supply)*
	* 1x Case, Raspberry Pi-compatible *(here: Argon One V2)*
	* 1x HDMI cable
	* 1x Keyboard and mouse ⌨️🖱️ *(here: Logitech K400+)*


## Prepare the software, pt. 1 🦙 1️⃣

1. Connect the Micro SD card to the computer
2. Download, install, and run **Raspberry Pi Imager**:
	1. Choose OS: Raspberry Pi OS (other) ➡ **Raspberry Pi OS (64-bit)**
	2. Write to the Micro SD card
	* Tested with v1.7.2 on Windows
2. Clone this repository.
2. Configure:
	1. Eject and re-insert the SD card
	2. Copy all items from the cloned `SD_card/` folder to the root folder of the drive called **"boot"**
	* ⚠️ Enter the actual WiFi SSID and password in `wpa_supplicant.conf`
2. Eject the Micro SD card from the computer
2. Insert the Micro SD card into the Ras Pi, connect all cables/devices, and finally start the Ras Pi


## Prepare the software, pt. 2 🦙 2️⃣

⚠️ Keep in mind to replace `<USERNAME>` with the actual user name in the below commands.

1. Go through the initial setup of the operating system
2. Clone _this_ repository:
	1. Run `mkdir -p ~/GitHub/IanStorm/`
	2. Run `cd ~/GitHub/IanStorm/`
	2. Run `git clone https://github.com/IanStorm/my-home-raspi.git`
2. Configure _crontab_:
	1. Run `crontab -e`, select `/bin/nano` as your editor, exit via <kbd>CTRL</kbd>+<kbd>X</kbd>
	2. Configure an output handler: Run `sudo apt update && sudo apt install -y postfix`, select "Local only" during the setup
	* ☝ _crontab_ logs are found at `/var/mail/<USERNAME>`
2. Map cloned folder:
	1. Run `sudo mkdir -p /opt/IanStorm/`
	2. Run `sudo ln --symbolic /home/<USERNAME>/GitHub/IanStorm/my-home-raspi/htpc_bedroom/opt/IanStorm/my-home-raspi/ /opt/IanStorm/`
2. Run `crontab -e`, then jump to the end of the file via <kbd>CTRL</kbd>+<kbd>END</kbd>, and append the following content:
```sh
# my-home-raspi
@reboot sleep 10 && cd /home/<USERNAME>/GitHub/IanStorm/my-home-raspi/ && git reset --hard && git pull
@reboot sleep 10 && /opt/IanStorm/my-home-raspi/on_booted.sh
```
*
	* Exit via <kbd>CTRL</kbd>+<kbd>X</kbd>, then <kbd>y</kbd>, and finally <kbd>Enter</kbd>


## Prepare the software, pt. 3 🦙 3️⃣

1. Configure _Chromium_:
	1. Enable DRM compatibility:
		1. Run `sudo apt update && sudo apt install -y chromium-browser:armhf`
		2. Run `sudo apt update && sudo apt install -y libwidevinecdm0`
	2. Prevent "Page unresponsive" issue: Run `echo 'export CHROMIUM_FLAGS="$CHROMIUM_FLAGS --use-gl=egl"' | sudo tee /etc/chromium.d/egl`
	2. Use dark theme
2. Add _GShutdown_:
	1. [Download](https://pkgs.org/download/gshutdown) and install the `.deb` package; see https://github.com/Asher256/gshutdown
	2. Set custom commands:
		* Turn off the computer: `shutdown`
		* Restart computer: `reboot`
2. Add _Netflix_:
	1. Login to Netflix
	2. Create a _Chromium_ shortcut for `https://netflix.com/browse`
2. Add _Spotify_:
	1. Install the `https://open.spotify.com` Progressive Web App (PWA)
	2. Login to Spotify
2. Add _YouTube_:
	1. Install the `https://youtube.com` PWA
	2. Login to YouTube
	2. Set dark theme as preferred theme
	2. Settings ➡ Playback and performance ➡ Disable inline playback


## Appendix


### Sources 📙

* https://forums.raspberrypi.com/viewtopic.php?p=1990606
* https://www.electromaker.io/tutorial/blog/how-to-stream-netflix-on-raspberry-pi
* https://github.com/raspberrypi/Raspberry-Pi-OS-64bit/issues/172#issuecomment-1123462739
* https://jarrodstech.net/how-to-raspberry-pi-onedrive-sync/
