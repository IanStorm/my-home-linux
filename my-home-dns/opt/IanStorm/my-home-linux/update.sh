#!/bin/bash

# ⬇️ Clean before stop
# ⬇️ Does not remove user Docker stuff
# ⬇️ Removes unused Docker stuff with a delay of 1 day
./clean.sh

# ⬇️ Pulling needs to be done before stopping the DNS resolver
./get.sh

./stop.sh

sudo reboot
