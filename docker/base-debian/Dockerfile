FROM debian:jessie

# Set the root password
RUN echo "root:tt" | chpasswd

# Install packages for building ruby
RUN apt-get update && apt-get install -y \
    autoconf             \
    bison                \
    build-essential      \
    curl                 \
    libcurl4-openssl-dev \
    libffi-dev           \
    libgdbm3             \
    libgdbm-dev          \
    libncurses5-dev      \
    libreadline6-dev     \
    libssl-dev           \
    libsqlite3-dev       \
    libyaml-dev          \
    sqlite3              \
    zlib1g-dev           \
    libgmp3-dev          \
    nodejs               \
    postgresql           \
    postgresql-contrib   \
    libpq-dev

# Useful for development
RUN apt-get install -y \
    git       \
    procps    \
    sudo      \
    unzip     \
    vim       \
    wget

# Setup locale
RUN apt-get install -y locales
RUN dpkg-reconfigure locales && \
  echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && locale-gen && \
  /usr/sbin/update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

RUN apt-get clean

# Change timezone to Pacific
RUN rm /etc/localtime && ln -s /usr/share/zoneinfo/US/Pacific /etc/localtime

# Add script for rebasing a user (used in pyenv/rbenv images)
RUN mkdir /docker-scripts
ADD docker-scripts/* /docker-scripts/
RUN chmod +x /docker-scripts/*

# Create container-init folder
RUN mkdir /var/lock/container-init && chmod 777 /var/lock/container-init
