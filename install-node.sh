#!/bin/bash

###
# CHECK ARGUMENTS
###
if [[ $# -ne 2 ]]; then
  echo "USAGE: install-node.sh <<nvm version>> <<node version>>"
  exit 1
fi

###
# DEFINE NVM VERSION
###
NVM_VERSION=$1

###
# DEFINE NODE VERSION
###
NODE_VERSION=$2

###
# INSTALL NVM
###
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh | bash

###
# RESTORE DOTFILES
###
cd .dotfiles && git checkout . && cd ..

###
# INSTALL NODE
###
su -l pmviva -c "nvm install $NODE_VERSION"

###
# ASK TO INSTALL ANGULAR
###
read -p "Do you wish to install angular? (Y/N)" INSTALL_ANGULAR

###
# INSTALL ANGULAR
###
if [[ "$INSTALL_ANGULAR" =~ [yY] ]]; then
  su -l pmviva -c "npm i -g @angular/cli"
else
  echo "Skipping the angular installation"
fi

###
# ASK TO INSTALL VUE
###
read -p "Do you wish to install vue? (Y/N)" INSTALL_VUE

###
# INSTALL VUE
###
if [[ "$INSTALL_VUE" =~ [yY] ]]; then
  su -l pmviva -c "npm i -g @vue/cli"
else
  echo "Skipping the vue installation"
fi
