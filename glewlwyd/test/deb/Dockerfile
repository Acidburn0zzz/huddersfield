FROM babelouest/deb

ARG ORCANIA_VERSION
ARG YDER_VERSION
ARG ULFIUS_VERSION
ARG HOEL_VERSION
ARG RHONABWY_VERSION
ARG IDDAWC_VERSION
ARG GLEWLWYD_VERSION
ARG LIBJANSSON_VERSION
ARG LIBCBOR_VERSION
ARG MEMCHECK

# Install required packages
RUN apt-get update && \
	apt-get upgrade -y && \
    apt-get install -y \
    bc \
    g++ \
    autoconf \
    sqlite3 \
    libconfig-dev \
    libsystemd-dev \
    libjansson-dev \
    libssl-dev \
    libcurl4-gnutls-dev \
    libldap2-dev \
    libmicrohttpd-dev \
    libsqlite3-dev \
    libpq-dev \
    libtool \
    make \
    wget \
    liboath-dev \
    default-mysql-client \
    default-libmysqlclient-dev \
    check \
    gnutls-bin \
    valgrind \
    zlib1g-dev \
    libsubunit-dev && \
    apt-get install -y libcbor-dev || \
    (cd /opt && wget https://github.com/PJK/libcbor/archive/v${LIBCBOR_VERSION}.tar.gz -O libcbor.tar.gz && \
    tar xf libcbor.tar.gz && cd libcbor-${LIBCBOR_VERSION} && mkdir build && cd build && cmake .. && make && make install && ldconfig)

# Install jansson from github on ubuntu Bionic and Debian oldstable
RUN if [ $(lsb_release -cs) = "bionic" ] || [ $(lsb_release -cs) = "stretch" ]; then \
    apt-get remove --purge -y libjansson4; \
    (cd /opt && wget https://github.com/akheron/jansson/archive/v${LIBJANSSON_VERSION}.tar.gz -O jansson.tar.gz && \
    tar xf jansson.tar.gz && cd jansson-${LIBJANSSON_VERSION} && autoreconf -i && ./configure && make && make install && ldconfig) \
    fi

RUN echo ${ORCANIA_VERSION} > /opt/ORCANIA_VERSION
RUN echo ${YDER_VERSION} > /opt/YDER_VERSION
RUN echo ${ULFIUS_VERSION} > /opt/ULFIUS_VERSION
RUN echo ${HOEL_VERSION} > /opt/HOEL_VERSION
RUN echo ${RHONABWY_VERSION} > /opt/RHONABWY_VERSION
RUN echo ${IDDAWC_VERSION} > /opt/IDDAWC_VERSION
RUN echo ${GLEWLWYD_VERSION} > /opt/GLEWLWYD_VERSION
RUN echo ${MEMCHECK} > /opt/MEMCHECK

CMD ["/share/glewlwyd/test/deb/entrypoint.sh"]
