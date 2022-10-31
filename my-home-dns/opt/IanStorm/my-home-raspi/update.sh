#!/bin/bash

# ⬇️ Clean before stop
# ⬇️ Does not remove user Docker stuff
# ⬇️ Removes unused Docker stuff with a delay of 1 day
./clean.sh

./stop.sh

./get.sh

./start.sh
