#------------------------------------------------------------------------------
# Set the base image for subsequent instructions:
#------------------------------------------------------------------------------

FROM centos:7
MAINTAINER Marc Villacorta Morera <marc.villacorta@gmail.com>

#------------------------------------------------------------------------------
# Install:
#------------------------------------------------------------------------------

RUN rpm --import http://mirror.centos.org/centos/7/os/x86_64/RPM-GPG-KEY-CentOS-7
RUN yum update -y && yum clean all
RUN yum install -y java-1.7.0-openjdk-headless wget tar && yum clean all
RUN wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz | \
    tar -xzf - -C /opt && chown -R root:root /opt/zookeeper*
ADD rootfs /

#------------------------------------------------------------------------------
# Entrypoint:
#------------------------------------------------------------------------------

ENTRYPOINT ["/init", "/opt/zookeeper-3.4.6/bin/zkServer.sh", "start-foreground"]
