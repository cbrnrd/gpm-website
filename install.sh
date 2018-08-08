#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root. Try `curl -fsSL https://git.io/get-gpm | sudo bash`" 
   exit 1
fi

set -e

if ! command -v crystal 2>/dev/null ; then
  echo "The crystal compiler is not installed. Installing..."
  curl -sSL https://dist.crystal-lang.org/apt/setup.sh | bash
  sudo apt-get install build-essential crystal
fi

git clone https://github.com/cbrnrd/gpm
cd gpm

echo "Building gpm..."

make install

sudo cp bin/gpm /usr/local/bin/gpm
username=$(whoami)

echo "All done! Just run `gpm help` to start"
