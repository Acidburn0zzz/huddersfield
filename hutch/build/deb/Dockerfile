FROM babelouest/deb

ARG ORCANIA_VERSION
ARG YDER_VERSION
ARG ULFIUS_VERSION
ARG HOEL_VERSION
ARG HUTCH_VERSION
ARG LIBJWT_VERSION

# Install required packages
RUN apt-get update && \
		apt-get install -y \
		autoconf \
		libconfig-dev \
		libjansson-dev \
		libsystemd-dev \
		libssl-dev \
		libcurl4-gnutls-dev \
		libmicrohttpd-dev \
		libsqlite3-dev \
		libpq-dev \
		libtool \
		make \
		wget \
		default-libmysqlclient-dev

# libtool and autoconf may be required, install them with 'sudo apt-get install libtool autoconf'
RUN cd /opt && \
		wget https://github.com/benmcollins/libjwt/archive/v${LIBJWT_VERSION}.tar.gz && \
		tar -zxvf v${LIBJWT_VERSION}.tar.gz && \
		rm v${LIBJWT_VERSION}.tar.gz && \
		cd libjwt-${LIBJWT_VERSION}/ && \
		autoreconf -i && \
		(./configure --without-openssl || ./configure) && \
		make && \
		make install

RUN echo ${ORCANIA_VERSION} > /opt/ORCANIA_VERSION
RUN echo ${YDER_VERSION} > /opt/YDER_VERSION
RUN echo ${ULFIUS_VERSION} > /opt/ULFIUS_VERSION
RUN echo ${HOEL_VERSION} > /opt/HOEL_VERSION
RUN echo ${HUTCH_VERSION} > /opt/HUTCH_VERSION

COPY ["entrypoint.sh", "/"]

CMD ["/entrypoint.sh"]
