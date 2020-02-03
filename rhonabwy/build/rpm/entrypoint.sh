#!/bin/bash

set -e

ORCANIA_ARCHIVE=/share/orcania/orcania.tar.gz
YDER_ARCHIVE=/share/yder/yder.tar.gz
ULFIUS_ARCHIVE=/share/ulfius/ulfius.tar.gz
RHONABWY_ARCHIVE=/share/rhonabwy/rhonabwy.tar.gz

if [ -f $ORCANIA_ARCHIVE ] && [ -f $YDER_ARCHIVE ] && [ -f $ULFIUS_ARCHIVE ] && [ -f $RHONABWY_ARCHIVE ]; then
  ORCANIA_VERSION=$(cat /opt/ORCANIA_VERSION)
  YDER_VERSION=$(cat /opt/YDER_VERSION)
  ULFIUS_VERSION=$(cat /opt/ULFIUS_VERSION)
  RHONABWY_VERSION=$(cat /opt/RHONABWY_VERSION)
  
  mkdir /opt/orcania/

  tar -zxvf $ORCANIA_ARCHIVE -C /opt/orcania --strip 1

  mkdir /opt/orcania/build

  cd /opt/orcania/build

  cmake -DBUILD_RPM=on ..

  make package

  make install

  cp liborcania-dev_$ORCANIA_VERSION.rpm /opt/liborcania-dev_${ORCANIA_VERSION}_$(lsb_release -si)_$(lsb_release -sd|tr -d \"|sed 's/ /_/g'|sed 's/[)(]//g')_$(uname -m).rpm
  echo liborcania-dev_${ORCANIA_VERSION}_$(lsb_release -si)_$(lsb_release -sd|tr -d \"|sed 's/ /_/g'|sed 's/[)(]//g')_$(uname -m).rpm > /share/ulfius/packages

  mkdir /opt/yder/

  tar -zxvf $YDER_ARCHIVE -C /opt/yder --strip 1

  mkdir /opt/yder/build

  cd /opt/yder/build

  cmake -DBUILD_RPM=on ..

  make package

  make install

  cp libyder-dev_$YDER_VERSION.rpm /opt/libyder-dev_${YDER_VERSION}_$(lsb_release -si)_$(lsb_release -sd|tr -d \"|sed 's/ /_/g'|sed 's/[)(]//g')_$(uname -m).rpm

  mkdir /opt/ulfius/

  tar -zxf $ULFIUS_ARCHIVE -C /opt/ulfius --strip 1

  mkdir /opt/ulfius/build

  cd /opt/ulfius/build

  cmake -DBUILD_RPM=on ..

  make package

  make install

  cp libulfius-dev_$ULFIUS_VERSION.rpm /opt/libulfius-dev_${ULFIUS_VERSION}_$(lsb_release -si)_$(lsb_release -sd|tr -d \"|sed 's/ /_/g'|sed 's/[)(]//g')_$(uname -m).rpm

  mkdir /opt/rhonabwy/

  tar -zxf $RHONABWY_ARCHIVE -C /opt/rhonabwy --strip 1

  mkdir /opt/rhonabwy/build

  cd /opt/rhonabwy/build

  cmake -DBUILD_RPM=on ..

  make package

  ls -l /opt/RHONABWY_VERSION
  cp librhonabwy-dev_$RHONABWY_VERSION.rpm /opt/librhonabwy-dev_${RHONABWY_VERSION}_$(lsb_release -si)_$(lsb_release -sd|tr -d \"|sed 's/ /_/g'|sed 's/[)(]//g')_$(uname -m).rpm
  cp librhonabwy-dev_$RHONABWY_VERSION.rpm /share/rhonabwy/librhonabwy-dev_${RHONABWY_VERSION}_$(lsb_release -si)_$(lsb_release -sd|tr -d \"|sed 's/ /_/g'|sed 's/[)(]//g')_$(uname -m).rpm

  echo librhonabwy-dev_${RHONABWY_VERSION}_`grep -e "^ID=" /etc/os-release |cut -c 4-`_`lsb_release -c -s`_`uname -m`.rpm > /share/rhonabwy/packages

  cd /opt/

  tar cvz liborcania-dev_${ORCANIA_VERSION}_$(lsb_release -si)_$(lsb_release -sd|tr -d \"|sed 's/ /_/g'|sed 's/[)(]//g')_$(uname -m).rpm \
          libyder-dev_${YDER_VERSION}_$(lsb_release -si)_$(lsb_release -sd|tr -d \"|sed 's/ /_/g'|sed 's/[)(]//g')_$(uname -m).rpm \
          libulfius-dev_${ULFIUS_VERSION}_$(lsb_release -si)_$(lsb_release -sd|tr -d \"|sed 's/ /_/g'|sed 's/[)(]//g')_$(uname -m).rpm \
          librhonabwy-dev_${RHONABWY_VERSION}_$(lsb_release -si)_$(lsb_release -sd|tr -d \"|sed 's/ /_/g'|sed 's/[)(]//g')_$(uname -m).rpm \
          -f /share/rhonabwy/rhonabwy-dev-full_${RHONABWY_VERSION}_$(lsb_release -si)_$(lsb_release -sd|tr -d \"|sed 's/ /_/g'|sed 's/[)(]//g')_$(uname -m).tar.gz

  echo rhonabwy-dev-full_${RHONABWY_VERSION}_$(lsb_release -si)_$(lsb_release -sd|tr -d \"|sed 's/ /_/g'|sed 's/[)(]//g')_$(uname -m).tar.gz >> /share/rhonabwy/packages
  
  echo "$(date -R) rhonabwy-dev-full_${RHONABWY_VERSION}_`grep -e "^ID=" /etc/os-release |cut -c 4-`_`lsb_release -c -s`_`uname -m`.tar.gz build success" >> /share/summary.log
else
  echo "Files $ORCANIA_ARCHIVE or $YDER_ARCHIVE or $ULFIUS_ARCHIVE or $RHONABWY_ARCHIVE not present" && false
fi
