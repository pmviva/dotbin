#!/bin/bash

###
# CHECK ARGUMENTS
###
if [[ $# -ne 1 ]]; then
  echo "USAGE: install-sdkman.sh <<java version>>"
  exit 1
fi

###
# DEFINE JAVA VERSION
###
JAVA_VERSION=$1

###
# INSTALL SDKMAN
###
curl -s "https://get.sdkman.io" | bash

###
# RESTORE DOTFILES
###
cd .dotfiles && git checkout . && cd .. && rm -rf .zshrc

###
# INSTALL JAVA
###
su -l pmviva -c "sdk install java $JAVA_VERSION"

###
# ASK TO INSTALL MAVEN
###
read -p "Do you wish to install maven? (Y/N)" INSTALL_MAVEN

###
# INSTALL MAVEN
###
if [[ "$INSTALL_MAVEN" =~ [yY] ]]; then
  su -l pmviva -c "sdk install maven"
else
  echo "Skipping the maven installation"
fi

###
# ASK TO INSTALL GRADLE
###
read -p "Do you wish to install gradle? (Y/N)" INSTALL_GRADLE

###
# INSTALL GRADLE
###
if [[ "$INSTALL_GRADLE" =~ [yY] ]]; then
  su -l pmviva -c "sdk install gradle"
else
  echo "Skipping the gradle installation"
fi

###
# ASK TO INSTALL SPRING BOOT
###
read -p "Do you wish to install spring boot? (Y/N)" INSTALL_SPRING_BOOT

###
# INSTALL SPRING BOOT
###
if [[ "$INSTALL_SPRING_BOOT" =~ [yY] ]]; then
  su -l pmviva -c "sdk install springboot"
else
  echo "Skipping the spring boot installation"
fi
