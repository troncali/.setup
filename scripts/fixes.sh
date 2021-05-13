# Run as super user using `su` command if account has no admin privileges

### TODO: Configure Homebrew for Multi-user
# https://medium.com/@leifhanack/homebrew-multi-user-setup-e10cb5849d59


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

### MongoDB
sudo mkdir -p /data/db
sudo chown -R $(whoami) /data/db
