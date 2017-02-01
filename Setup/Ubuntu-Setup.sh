#!/bin/sh

# Add Keys
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D # Docker
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893

# Add Repositories
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ yakkety main" > /etc/apt/sources.list.d/dotnetdev.list'

# Install Apps
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade
sudo apt-get -y install \
	docker-engine \
	docker-compose \
	git \
	google-chrome-stable \
	mpv \
	nodejs \
	npm \
	pinta \
	redshift \
	redshift-gtk \
	spotify-client \
	steam \
	virtualbox

# None apt-get installs
# VS Code
if ! hash code 2>/dev/null; then
	wget http://go.microsoft.com/fwlink/?LinkID=760868 -O /tmp/vscode.deb
	sudo dpkg -i /tmp/vscode.deb
	sudo apt-get install -f -y
fi
if ! hash docker-compose 2>/dev/null; then
	curl -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
fi

# Configuration
sudo usermod -aG docker $(whoami) # Stop requiring sudo for docker

# To automate at a later date:
# nVidia Drivers
# CrashPlan - Need to configure engine start https://support.code42.com/CrashPlan/4/Troubleshooting/Stopping_And_Starting_The_CrashPlan_Service
# Spotify - apply this fix: https://www.reddit.com/r/spotify/comments/3cear9/linux_spotify_scaling/
