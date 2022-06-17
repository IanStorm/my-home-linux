#!/bin/bash

# ⬇ Sync OneDrive data, one-way to machine
rclone sync --progress onedrive:MEDIA_+/ ~/OneDrive/MEDIA_+/
