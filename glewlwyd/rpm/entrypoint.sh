#!/bin/bash

set -e

ORCANIA_ARCHIVE=/share/orcania/orcania.tar.gz
YDER_ARCHIVE=/share/yder/yder.tar.gz
ULFIUS_ARCHIVE=/share/ulfius/ulfius.tar.gz
HOEL_ARCHIVE=/share/hoel/hoel.tar.gz
GLEWLWYD_ARCHIVE=/share/glewlwyd/glewlwyd.tar.gz

if [ -f $ORCANIA_ARCHIVE ] && [ -f $YDER_ARCHIVE ] && [ -f $ULFIUS_ARCHIVE ] && [ -f $HOEL_ARCHIVE ] && [ -f $GLEWLWYD_ARCHIVE ]; then
  ORCANIA_VERSION=$(cat /opt/ORCANIA_VERSION)
  YDER_VERSION=$(cat /opt/YDER_VERSION)
  ULFIUS_VERSION=$(cat /opt/ULFIUS_VERSION)
  HOEL_VERSION=$(cat /opt/HOEL_VERSION)
  GLEWLWYD_VERSION=$(cat /opt/GLEWLWYD_VERSION)
  
  mkdir /opt/orcania/

  tar -zxvf $ORCANIA_ARCHIVE -C /opt/orcania --strip 1

  mkdir /opt/orcania/build

  cd /opt/orcania/build

  cmake -DBUILD_RPM=on ..

  make install

  make package

  cp liborcania-dev_$ORCANIA_VERSION.rpm /share/glewlwyd/liborcania-dev_${ORCANIA_VERSION}_$(grep -e "^ID=" /etc/os-release |cut -c 4-)_$(lsb_release -c -s)_$(uname -m).rpm

  rm -rf *

  cmake -DBUILD_RPM=on -DINSTALL_HEADER=off ..

  make package

  cp liborcania_$ORCANIA_VERSION.rpm /opt/liborcania_${ORCANIA_VERSION}_$(grep -e "^ID=" /etc/os-release |cut -c 4-)_$(lsb_release -c -s)_$(uname -m).rpm

  mkdir /opt/yder/

  tar -zxvf $YDER_ARCHIVE -C /opt/yder --strip 1

  mkdir /opt/yder/build

  cd /opt/yder/build

  cmake -DBUILD_RPM=on ..

  make install

  make package

  cp libyder-dev_$YDER_VERSION.rpm /share/glewlwyd/libyder-dev_${YDER_VERSION}_$(grep -e "^ID=" /etc/os-release |cut -c 4-)_$(lsb_release -c -s)_$(uname -m).rpm

  rm -rf *

  cmake -DBUILD_RPM=on -DINSTALL_HEADER=off ..

  make package

  cp libyder_$YDER_VERSION.rpm /opt/libyder_${YDER_VERSION}_$(grep -e "^ID=" /etc/os-release |cut -c 4-)_$(lsb_release -c -s)_$(uname -m).rpm

  mkdir /opt/ulfius/

  tar -zxvf $ULFIUS_ARCHIVE -C /opt/ulfius --strip 1

  mkdir /opt/ulfius/build

  cd /opt/ulfius/build

  cmake -DBUILD_RPM=on ..

  make install

  make package

  cp libulfius-dev_$ULFIUS_VERSION.rpm /share/glewlwyd/libulfius-dev_${ULFIUS_VERSION}_$(grep -e "^ID=" /etc/os-release |cut -c 4-)_$(lsb_release -c -s)_$(uname -m).rpm

  rm -rf *

  cmake -DBUILD_RPM=on -DINSTALL_HEADER=off ..

  make package

  cp libulfius_$ULFIUS_VERSION.rpm /opt/libulfius_${ULFIUS_VERSION}_$(grep -e "^ID=" /etc/os-release |cut -c 4-)_$(lsb_release -c -s)_$(uname -m).rpm

  mkdir /opt/hoel/

  tar -zxvf $HOEL_ARCHIVE -C /opt/hoel --strip 1

  mkdir /opt/hoel/build

  cd /opt/hoel/build

  cmake -DBUILD_RPM=on ..

  make install

  make package

  cp libhoel-dev_$HOEL_VERSION.rpm /share/glewlwyd/libhoel-dev_${HOEL_VERSION}_$(grep -e "^ID=" /etc/os-release |cut -c 4-)_$(lsb_release -c -s)_$(uname -m).rpm

  rm -rf *

  cmake -DBUILD_RPM=on -DINSTALL_HEADER=off ..

  make package

  cp libhoel_$HOEL_VERSION.rpm /opt/libhoel_${HOEL_VERSION}_$(grep -e "^ID=" /etc/os-release |cut -c 4-)_$(lsb_release -c -s)_$(uname -m).rpm

  mkdir /opt/glewlwyd/

  tar -zxvf $GLEWLWYD_ARCHIVE -C /opt/glewlwyd --strip 1

  mkdir /opt/glewlwyd/build
  
  cd /opt/glewlwyd/build
  
  cmake -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_RPM=on ..
  
  make package 
  
  cp glewlwyd_$GLEWLWYD_VERSION.rpm /share/glewlwyd/glewlwyd_${GLEWLWYD_VERSION}_$(grep -e "^ID=" /etc/os-release |cut -c 4-)_$(lsb_release -c -s)_$(uname -m).rpm
  cp glewlwyd_$GLEWLWYD_VERSION.rpm /opt/glewlwyd_${GLEWLWYD_VERSION}_$(grep -e "^ID=" /etc/os-release |cut -c 4-)_$(lsb_release -c -s)_$(uname -m).rpm
  echo glewlwyd_${GLEWLWYD_VERSION}_$(grep -e "^ID=" /etc/os-release |cut -c 4-)_$(lsb_release -c -s)_$(uname -m).rpm > /share/glewlwyd/packages
  
  rm -rf *
  
  cmake -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_RPM=on -DWITH_MOCK=on ..
  
  make package 
  
  cp glewlwyd_$GLEWLWYD_VERSION.rpm /share/glewlwyd/glewlwyd-dev_${GLEWLWYD_VERSION}_$(grep -e "^ID=" /etc/os-release |cut -c 4-)_$(lsb_release -c -s)_$(uname -m).rpm
  
  cd /opt
  
  tar cvz liborcania_${ORCANIA_VERSION}_$(grep -e "^ID=" /etc/os-release |cut -c 4-)_$(lsb_release -c -s)_$(uname -m).rpm \
          libyder_${YDER_VERSION}_$(grep -e "^ID=" /etc/os-release |cut -c 4-)_$(lsb_release -c -s)_$(uname -m).rpm \
          libulfius_${ULFIUS_VERSION}_$(grep -e "^ID=" /etc/os-release |cut -c 4-)_$(lsb_release -c -s)_$(uname -m).rpm \
          libhoel_${HOEL_VERSION}_$(grep -e "^ID=" /etc/os-release |cut -c 4-)_$(lsb_release -c -s)_$(uname -m).rpm \
          glewlwyd_${GLEWLWYD_VERSION}_$(grep -e "^ID=" /etc/os-release |cut -c 4-)_$(lsb_release -c -s)_$(uname -m).rpm \
          -f /share/glewlwyd/glewlwyd-full_${GLEWLWYD_VERSION}_$(grep -e "^ID=" /etc/os-release |cut -c 4-)_$(lsb_release -c -s)_$(uname -m).tar.gz
  echo glewlwyd-full_${GLEWLWYD_VERSION}_$(grep -e "^ID=" /etc/os-release |cut -c 4-)_$(lsb_release -c -s)_$(uname -m).tar.gz >> /share/glewlwyd/packages
  
  echo "$(date -R) glewlwyd-full_${GLEWLWYD_VERSION}_$(grep -e "^ID=" /etc/os-release |cut -c 4-)_$(lsb_release -c -s)_$(uname -m).tar.gz build success" >> /share/summary.log
else
  echo "Files $ORCANIA_ARCHIVE or $YDER_ARCHIVE or $ULFIUS_ARCHIVE or $HOEL_ARCHIVE or $GLEWLWYD_ARCHIVE not present" && false
fi
