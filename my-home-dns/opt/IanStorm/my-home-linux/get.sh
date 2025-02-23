#!/bin/bash

git reset --hard && git pull --ff-only

docker pull ianstorm/my-home-pihole:latest
