#!/bin/bash

# ⬇ Disable big/red LED
# ⬇ 	👀 https://raspberrypi.stackexchange.com/a/71557
# ⬇ 	👀 https://stackoverflow.com/a/36853636
echo 0 | sudo tee /sys/class/leds/led1/brightness
echo none | sudo tee /sys/class/leds/led1/trigger
