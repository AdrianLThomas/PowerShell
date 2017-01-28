#!/bin/sh
$APPS="pinta steam-launcher p7zip mpv virtualbox redshift redshift-gtk"

apt-get update
apt-get install $APPS

# To automate at a later date:
# nVidia Drivers
# CrashPlan - Need to configure engine start https://support.code42.com/CrashPlan/4/Troubleshooting/Stopping_And_Starting_The_CrashPlan_Service
# Chrome
# Flux
# Spotify - https://www.spotify.com/uk/download/linux/
## Then need to apply this fix: https://www.reddit.com/r/spotify/comments/3cear9/linux_spotify_scaling/
# VS Code - https://code.visualstudio.com/docs/?dv=linux64_deb
