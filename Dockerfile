FROM ubuntu:20.04

COPY files/run.sh /

COPY files/SSMInstaller.sh /
COPY files/SSMInstaller.properties /
COPY files/SSM_*_build.*_linux.zip /

WORKDIR /

# hadolint ignore=DL3008
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
      dumb-init \
      fontconfig \
      iputils-ping \
      libfreetype6 \
      supervisor \
      unzip \
    && unzip /SSM_*_build.*_linux.zip \
    && apt-get remove -y \
      unzip \
    && rm -rf /var/lib/apt/lists/*

COPY files/ssmserver.conf /etc/supervisor/conf.d/ssmserver.conf
COPY files/ssmweb.conf /etc/supervisor/conf.d/ssmweb.conf
COPY files/supervisord.conf /etc/supervisor/supervisord.conf

WORKDIR /root

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

LABEL "org.opencontainers.image.licenses"="ASL 2.0" \
      "org.opencontainers.image.source"="https://github.com/osism/docker-image-supermicro-server-manager" \
      "org.opencontainers.image.url"="https://www.osism.de" \
      "org.opencontainers.image.vendor"="Betacloud Solutions GmbH"
