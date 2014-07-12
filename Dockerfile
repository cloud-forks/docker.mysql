# Base
FROM phusion/baseimage:0.9.11
MAINTAINER Thomas Deinhamer <thasmo@gmail.com>

# Environment
ENV LANG C.UTF-8

# Setup
RUN add-apt-repository -y ppa:ondrej/mysql-5.6
RUN apt-get update -y
RUN apt-get install -y --force-yes mysql-server
RUN mkdir /etc/service/mysql
ADD ./run.sh /etc/service/mysql/run

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Volumes
VOLUME ["/etc/mysql", "/var/lib/mysql"]

# Ports
EXPOSE 3306

# Command
CMD ["/sbin/my_init"]
