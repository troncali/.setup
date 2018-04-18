
### Python

sudo mkdir -p /usr/local/Frameworks
sudo chown -R $(whoami) /usr/local/*
brew link --overwrite python

### OpenSSH
sudo mkdir /usr/local/sbin
sudo chmod 777 /usr/local/sbin
brew link openssh
sudo chmod 775 /usr/local/sbin
## add /usr/local/sbin to PATH
