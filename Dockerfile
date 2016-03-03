#------------------------------------------------------------------------------
# Set the base image for subsequent instructions:
#------------------------------------------------------------------------------

FROM centos:7
MAINTAINER Marc Villacorta Morera <marc.villacorta@gmail.com>

#-----------------------------------------------------------------------------
# Environment variables:
#-----------------------------------------------------------------------------

ENV URL="http://apache.mirrors.pair.com/zookeeper" \
    VERSION="3.4.8"

#------------------------------------------------------------------------------
# Install:
#------------------------------------------------------------------------------

RUN rpm --import http://mirror.centos.org/centos/7/os/x86_64/RPM-GPG-KEY-CentOS-7
RUN yum update -y && yum clean all
RUN yum install -y java-1.7.0-openjdk-headless wget tar && yum clean all
RUN wget -q -O - ${URL}/zookeeper-${VERSION}/zookeeper-${VERSION}.tar.gz | \
    tar -xzf - -C /opt && mv /opt/zookeeper-${VERSION} /opt/zookeeper \
    && chown -R root:root /opt/zookeeper && mkdir /data

#-----------------------------------------------------------------------------
# Populate root file system:
#-----------------------------------------------------------------------------

ADD rootfs /

#------------------------------------------------------------------------------
# Expose ports and entrypoint:
#------------------------------------------------------------------------------

EXPOSE 2181 2888 3888
ENTRYPOINT ["/init"]
