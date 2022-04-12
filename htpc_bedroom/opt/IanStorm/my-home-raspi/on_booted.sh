#!/bin/bash

# ⬇ Disable big/red LED
# ⬇ 	👀 https://raspberrypi.stackexchange.com/a/112136
# ⬇ 	👀 https://stackoverflow.com/a/36853636
echo none | sudo tee /sys/class/leds/led1/trigger
