FROM babelouest/tgz

# Install required packages
RUN apk add --no-cache \
		autoconf \
		automake \
		libconfig-dev \
		jansson-dev \
		gnutls-dev \
		libgcrypt-dev \
		libmicrohttpd-dev \
		sqlite-dev \
		mariadb-dev \
		libtool \
		make \
		gcc \
		g++ \
		curl-dev \
		openzwave-dev \
		libmpdclient-dev \
		util-linux-dev \
		wget \
		cmake \
		bash

ARG ORCANIA_VERSION
ARG YDER_VERSION
ARG ULFIUS_VERSION
ARG HOEL_VERSION
ARG ANGHARAD_VERSION
ARG BENOIC_VERSION
ARG CARLEON_VERSION
ARG GARETH_VERSION
ARG LIBJWT_VERSION

# libtool and autoconf may be required, install them with 'sudo apt-get install libtool autoconf'
RUN cd /opt && \
		wget https://github.com/benmcollins/libjwt/archive/v${LIBJWT_VERSION}.tar.gz && \
		tar -zxvf v${LIBJWT_VERSION}.tar.gz && \
		rm v${LIBJWT_VERSION}.tar.gz && \
		cd libjwt-${LIBJWT_VERSION}/ && \
		autoreconf -i && \
		./configure --without-openssl && \
		make && \
		make install && \
# Build Orcania
		cd /opt && \
		wget https://github.com/babelouest/orcania/archive/v${ORCANIA_VERSION}.tar.gz && \
		tar -zxvf v${ORCANIA_VERSION}.tar.gz && \
		rm v${ORCANIA_VERSION}.tar.gz && \
		cd orcania-${ORCANIA_VERSION}/ && \
		mkdir build && \
		cd build && \
		cmake .. && \
		make && \
		make install && \
		rm -rf * && \
		cmake -DINSTALL_HEADER=off .. && \
		make && \
		make package ; \
		cp liborcania_*.tar.gz /opt/liborcania_${ORCANIA_VERSION}_`grep -e "^ID=" /etc/os-release |cut -c 4-`_`grep -e "^VERSION_ID=" /etc/os-release |cut -c 12-`_`uname -m`.tar.gz && \
    echo  >> /opt/packages && \
# Build Yder
		cd /opt && \
		wget https://github.com/babelouest/yder/archive/v${YDER_VERSION}.tar.gz && \
		tar -zxvf v${YDER_VERSION}.tar.gz && \
		rm v${YDER_VERSION}.tar.gz && \
		cd yder-${YDER_VERSION}/ && \
		mkdir build && \
		cd build && \
		cmake -DWITH_JOURNALD=off .. && \
		make && \
		make install && \
		rm -rf * && \
		cmake -DWITH_JOURNALD=off -DINSTALL_HEADER=off .. && \
		make && \
		make package ; \
		cp libyder_*.tar.gz /opt/libyder_${YDER_VERSION}_`grep -e "^ID=" /etc/os-release |cut -c 4-`_`grep -e "^VERSION_ID=" /etc/os-release |cut -c 12-`_`uname -m`.tar.gz && \
    echo  >> /opt/packages && \
# Build Hoel
		cd /opt && \
		wget https://github.com/babelouest/hoel/archive/v${HOEL_VERSION}.tar.gz && \
		tar -zxvf v${HOEL_VERSION}.tar.gz && \
		rm v${HOEL_VERSION}.tar.gz && \
		cd hoel-${HOEL_VERSION}/ && \
		mkdir build && \
		cd build && \
		cmake -DWITH_PGSQL=off .. && \
		make && \
		make install && \
		rm -rf * && \
		cmake -DWITH_PGSQL=off -DINSTALL_HEADER=off .. && \
		make && \
		make package ; \
		cp libhoel_*.tar.gz /opt/libhoel_${HOEL_VERSION}_`grep -e "^ID=" /etc/os-release |cut -c 4-`_`grep -e "^VERSION_ID=" /etc/os-release |cut -c 12-`_`uname -m`.tar.gz && \
    echo  >> /opt/packages && \
# Build Ulfius
		cd /opt && \
		wget https://github.com/babelouest/ulfius/archive/v${ULFIUS_VERSION}.tar.gz && \
		tar -zxvf v${ULFIUS_VERSION}.tar.gz && \
		rm v${ULFIUS_VERSION}.tar.gz && \
		cd ulfius-${ULFIUS_VERSION}/ && \
		mkdir build && \
		cd build && \
		cmake -DWITH_WEBSOCKET=off .. && \
		make && \
		make install && \
		rm -rf * && \
		cmake -DWITH_WEBSOCKET=off -DINSTALL_HEADER=off .. && \
		make && \
		make package ; \
		cp libulfius_*.tar.gz /opt/libulfius_${ULFIUS_VERSION}_`grep -e "^ID=" /etc/os-release |cut -c 4-`_`grep -e "^VERSION_ID=" /etc/os-release |cut -c 12-`_`uname -m`.tar.gz && \
    echo  >> /opt/packages && \
# Build Angharad
		cd /opt && \
		wget https://github.com/babelouest/angharad/archive/v${ANGHARAD_VERSION}.tar.gz -O v${ANGHARAD_VERSION}.tar.gz && \
		tar -xvf v${ANGHARAD_VERSION}.tar.gz && \
		rm v${ANGHARAD_VERSION}.tar.gz && \
		wget https://github.com/babelouest/benoic/archive/v${BENOIC_VERSION}.tar.gz -O v${BENOIC_VERSION}.tar.gz && \
		tar -xvf v${BENOIC_VERSION}.tar.gz && \
		rm v${BENOIC_VERSION}.tar.gz && \
		wget https://github.com/babelouest/carleon/archive/v${CARLEON_VERSION}.tar.gz -O v${CARLEON_VERSION}.tar.gz && \
		tar -xvf v${CARLEON_VERSION}.tar.gz && \
		rm v${CARLEON_VERSION}.tar.gz && \
		wget https://github.com/babelouest/gareth/archive/v${GARETH_VERSION}.tar.gz -O v${GARETH_VERSION}.tar.gz && \
		tar -xvf v${GARETH_VERSION}.tar.gz && \
		rm v${GARETH_VERSION}.tar.gz && \
		mv benoic-${BENOIC_VERSION}/* angharad-${ANGHARAD_VERSION}/src/benoic/ && \
		mv carleon-${CARLEON_VERSION}/* angharad-${ANGHARAD_VERSION}/src/carleon/ && \
		mv gareth-${GARETH_VERSION}/* angharad-${ANGHARAD_VERSION}/src/gareth/ && \
		cd angharad-${ANGHARAD_VERSION} && \
		mkdir build && \
		cd build && \
		cmake .. && \
		make && \
		make package; \
		cp angharad_*.tar.gz /opt/angharad_${ANGHARAD_VERSION}_`grep -e "^ID=" /etc/os-release |cut -c 4-`_`grep -e "^VERSION_ID=" /etc/os-release |cut -c 12-`_`uname -m`.tar.gz && \
    echo angharad_${ANGHARAD_VERSION}_`grep -e "^ID=" /etc/os-release |cut -c 4-`_`grep -e "^VERSION_ID=" /etc/os-release |cut -c 12-`_`uname -m`.tar.gz >> /opt/packages && \
# make an archive based on 3 pckages
		cd /opt && \
		tar cvz *.tar.gz -f angharad-full_${ANGHARAD_VERSION}_`grep -e "^ID=" /etc/os-release |cut -c 4-`_`grep -e "^VERSION_ID=" /etc/os-release |cut -c 12-`_`uname -m`.tar.gz && \
    echo angharad-full_${ANGHARAD_VERSION}_`grep -e "^ID=" /etc/os-release |cut -c 4-`_`grep -e "^VERSION_ID=" /etc/os-release |cut -c 12-`_`uname -m`.tar.gz >> /opt/packages

COPY ["entrypoint.sh", "/"]

CMD ["/entrypoint.sh"]
