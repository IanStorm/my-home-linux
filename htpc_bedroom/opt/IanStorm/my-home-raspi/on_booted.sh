#!/bin/bash

# ⬇ Disable big/red LED
# ⬇ 	👀 https://raspberrypi.stackexchange.com/a/71557
# ⬇ 	👀 https://stackoverflow.com/a/36853636
echo 0 | sudo tee /sys/class/leds/PWR/brightness
echo none | sudo tee /sys/class/leds/PWR/trigger

# ⬇ Set audio volume
# ⬇ 	👀 https://raspberrypi.stackexchange.com/a/37132
while amixer sget 'Master' 2>&1 | grep -i -w 'unable to find simple control'
do
	sleep 5s
done
amixer sset 'Master' 25%
echo 'Set audio volume to 25%'
