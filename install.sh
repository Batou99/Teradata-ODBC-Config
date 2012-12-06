#!/bin/bash
install () {
case "$1" in
  debian)
    sudo dpkg -i $2/*.deb
    ;;
  redhat) 
    sudo rpm -i $2/*.rpm
    ;;
esac
}

case "$1" in
  debian|redhat)
    install $1 tdicu
    install $1 tdodbc
    install $1 cliv2
    sudo mkdir -p /usr/teragss/linux-i386
    sudo ln -s /opt/teradata/teragss/linux-i386/14.00.00.08 /usr/teragss/linux-i386/client
    sudo cp tdgssconfig.bin /usr/teragss/linux-i386/client/etc 
    cd rubycli-1.0.0
    make unix
    sudo make install
    cd ..
    echo read rubycli-1.0.0/README to test the installation
    ;;
  *)
  echo "USAGE: install.sh debian|redhat"
  ;;
esac

