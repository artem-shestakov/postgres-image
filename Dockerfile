ARG POSTGRES_VERSION=10
FROM postgres:$POSTGRES_VERSION
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    build-essential \
    locales \
    libffi-dev \
    libssl-dev \
    libyaml-dev \
    procps \
    python3 \
    python3-dev \
    python3-setuptools \
    python3-pip \
    python3-yaml \
    software-properties-common \
    sudo \
    rsyslog systemd systemd-cron sudo iproute2 \
    && rm -rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man
RUN sed -i 's/^\($ModLoad imklog\)/#\1/' /etc/rsyslog.conf

RUN locale-gen en_US.UTF-8

RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir certifi

COPY initctl_faker .
RUN chmod +x initctl_faker && rm -fr /sbin/initctl && ln -s /initctl_faker /sbin/initctl

RUN rm -f /lib/systemd/system/systemd*udev* \
  && rm -f /lib/systemd/system/getty.target

VOLUME ["/sys/fs/cgroup", "/tmp", "/run"]
CMD ["/lib/systemd/systemd"]