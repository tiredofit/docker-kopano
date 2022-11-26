ARG KOPANO_CORE_IMAGE_VERSION=latest
ARG KOPANO_CORE_VERSION=8.7
ARG KOPANO_WEBSERVICES_IMAGE_VERSION=2.4.4
ARG PHP_BASE=7.3
ARG DISTRO="debian"
ARG DISTRO_VARIANT="buster"

FROM docker.io/tiredofit/kopano-core:${DISTRO}-${DISTRO_VARIANT}-php${PHP_BASE}-kc${KOPANO_CORE_VERSION}-${KOPANO_CORE_IMAGE_VERSION} as kopano-core
FROM docker.io/tiredofit/kopano-webservices:${DISTRO}-${DISTRO_VARIANT}-php${PHP_BASE}-${KOPANO_WEBSERVICES_IMAGE_VERSION} as kopano-webservices
FROM docker.io/tiredofit/nginx-php-fpm:${PHP_BASE}-${DISTRO}_${DISTRO_VARIANT}

LABEL maintainer="Dave Conroy (github.com/tiredofit)"

COPY build-assets/ /build-assets

### Move Kopano Dependencies from Core image
COPY --from=kopano-core /kopano-dependencies/* /usr/src/kopano-dependencies/
### Move Kopano Prometheus Exporter built files from Core image
COPY --from=kopano-core /kopano-prometheus-exporter/* /usr/src/kopano-prometheus-exporter/
### Move Previously built files from Core image
COPY --from=kopano-core /kopano-core/* /usr/src/kopano-core/
COPY --from=kopano-core /*.md /assets/.changelogs/
### Move Previously built files from Webservices image
COPY --from=kopano-webservices /kopano-webservices/* /usr/src/kopano-webservices/
COPY --from=kopano-webservices /*.md /assets/.changelogs/

ENV NGINX_APPLICATION_CONFIGURATION=FALSE \
    NGINX_LOG_ACCESS_LOCATION=/logs/nginx \
    NGINX_LOG_BLOCKED_LOCATION=/logs/nginx \
    NGINX_LOG_ERROR_LOCATION=/logs/nginx \
    NGINX_SITE_ENABLED=null \
    NGINX_WEBROOT=/usr/share/kopano-webapp \
    PHP_CREATE_SAMPLE_PHP=FALSE \
    PHP_ENABLE_GETTEXT=TRUE \
    PHP_ENABLE_MAPI=TRUE \
    PHP_ENABLE_MBSTRING=TRUE \
    PHP_ENABLE_SIMPLEXML=TRUE \
    PHP_ENABLE_SOAP=TRUE \
    PHP_ENABLE_POSIX=TRUE \
    PHP_ENABLE_PDO=TRUE \
    PHP_ENABLE_PDO_SQLITE=TRUE \
    PHP_ENABLE_SHMOP=TRUE \
    PHP_ENABLE_SYSVSEM=TRUE \
    PHP_ENABLE_SYSVSHM=TRUE \
    PHP_ENABLE_XMLWRITER=TRUE \
    PHP_ENABLE_TOKENIZER=TRUE \
    PHP_LOG_LOCATION=/logs/php-fpm \
    IMAGE_NAME="tiredofit/kopano:${KOPANO_CORE_VERSION}" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-kopano/"

RUN set -x && \
    ### Add user and Group
    addgroup --gid 998 kopano && \
    adduser --uid 998 \
            --gid 998 \
            --gecos "Kopano User" \
            --home /dev/null \
            --no-create-home \
            --shell /sbin/nologin \
            --disabled-login \
            --disabled-password \
            kopano && \
    \
    apt-get update && \
    apt-get upgrade -y && \
    \
### Kopano Dependencies
    cd /usr/src/kopano-dependencies && \
    tar xavf kopano-dependencies.tar.zst --strip 1 -C . && \
    echo "deb [trusted=yes] file:/usr/src/kopano-dependencies ./" > /etc/apt/sources.list.d/kopano-dependencies.list && \
    \
    ##### Install Packages
    apt-get update && \
    BUILD_DEPS=" \
                build-essential \
                libev-dev \
                git \
                python3-dev \
                \
    " && \
    \
    KOPANO_DEPS=" \
                bc \
                libany-uri-escape-perl \
                libdata-uniqid-perl \
                libdb5.3++ \
                libdigest-hmac-perl \
                libev4 \
                libfile-copy-recursive-perl \
                libgsoap-kopano-2.8.109 \
                libhtml-entities-numbered-perl \
                libhx28 \
                libical3 \
                libimagequant0 \
                libio-socket-ssl-perl \
                libio-tee-perl \
                libjson-perl \
                libjson-webtoken-perl \
                libjsoncpp1 \
                libmail-imapclient-perl \
                libpython3.7 \
                libreadonly-perl \
                libs3-4 \
                libtidy5 \
                libunicode-string-perl \
                libvmime-kopano3 \
                libvmime1 \
                libwebpdemux2 \
                libwebpmux3 \
                man \
                poppler-utils \
                python3-bsddb3 \
                python3-certifi \
                python3-chardet \
                python3-configobj \
                python3-daemon \
                python3-dateutil \
                python3-idna \
                python3-jsonschema \
                python3-lockfile \
                python3-magic \
                python3-olefile \
                python3-pil \
                python3-pip \
                python3-pkg-resources \
                python3-prctl \
                python3-prettytable \
                python3-requests \
                python3-setproctitle \
                python3-setuptools \
                python3-six \
                python3-tabulate \
                python3-tz \
                python3-tzlocal \
                python3-ujson \
                python3-urllib3 \
                python3-wheel \
                python3-xapian \
                rsync \
                sqlite3 \
                unzip \
                zstd \
                " && \
    \
    apt-get install -y --no-install-recommends \
                       ${BUILD_DEPS} \
                       ${KOPANO_DEPS} \
    && \
    \
    ## Python Deps for Spamd
    pip3 install inotify && \
    \
    ## Webapp Python Scripts
    pip3 install dotty_dict && \
    \
    ### KDAV Install
    ### Temporary Hack for KDAV - Using Apache along side of Nginx is not what I want to do, but see issues
    ### posted at https://forum.kopano.io/topic/3433/kdav-with-nginx
    apt-get install -y --no-install-recommends \
                     apache2 \
                     crudini \
                     libapache2-mod-php${PHP_BASE} \
                     sqlite \
                     && \
    rm -rf /etc/apache2/sites-enabled/* && \
    a2disconf other-vhosts-access-log && \
    a2enmod rewrite && \
    sed -i "s#export APACHE_RUN_USER=www-data#export APACHE_RUN_USER=nginx#g" /etc/apache2/envvars && \
    crudini --set /etc/php/${PHP_BASE}/apache2/php.ini PHP upload_max_filesize 500M && \
    crudini --set /etc/php/${PHP_BASE}/apache2/php.ini PHP post_max_size 500M && \
    crudini --set /etc/php/${PHP_BASE}/apache2/php.ini PHP max_input_vars 1800 && \
    crudini --set /etc/php/${PHP_BASE}/apache2/php.ini Session session.save_path /run/sessions && \
    apt-get remove -y crudini && \
    rm -rf /etc/apache2/ports.conf && \
    ##########
    \
    ##### Unpack KCOIDC
    tar xaf /usr/src/kopano-core/kopano-kcoidc.tar.zst -C / && \
    \
    ##### Unpack Core
    tar xaf /usr/src/kopano-core/kopano-core.tar.zst -C / && \
    \
    ##### Unpack Prometheus
    tar xaf /usr/src/kopano-prometheus-exporter/kopano-prometheus-exporter.tar.zst -C / && \
    \
    ##### Unpack Webservices
    tar xaf /usr/src/kopano-webservices/kopano-webservices.tar.zst -C / && \
    \
    ### Build Assets Override
    if [ -d "/build-assets/src" ] ; then cp -Rp /build-assets/src/* / ; fi; \
    if [ -d "/build-assets/scripts" ] ; then for script in /build-assets/scripts/*.sh; do echo "** Applying $script"; bash $script; done && \ ; fi ; \
    rm -rf /build-assets/ && \
    \
    php-ext enable core && \
    \
    ##### Cleanup
    apt-get purge -y \
                    ${BUILD_DEPS} \
                    && \
    \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /etc/apt/sources.list.d/kopano*.list && \
    rm -rf /usr/src/* && \
    rm -rf /etc/logrotate.d/* && \
    rm -rf /var/log/*

### Assets Install
COPY CHANGELOG.md /assets/.changelogs/tiredofit_docker-kopano.md
COPY install /
