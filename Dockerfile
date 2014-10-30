# Dockfile for Monitoring Project
# VERSION 0.0.1

FROM centos
MAINTAINER Jirawat I. <nodtem66@gmail.com>

# Install Dataturbine (Ring buffer network) binary
RUN \
  mkdir -p /opt/dataturbine/ && \
  mkdir -p /opt/dataturbine/data/
ADD rbnb.jar /opt/dataturbine/
ADD docker-entrypoint.sh /opt/dataturbine/

# Install Oracle JDK
COPY jdk-7u71-linux-x64.rpm /tmp/jdk.rpm
RUN \
  rpm -ivh /tmp/jdk.rpm && \
  rm -f /tmp/jdk.rpm && \
  chmod a+x /opt/dataturbine/docker-entrypoint.sh
EXPOSE 3333
WORKDIR /opt/dataturbine
ENTRYPOINT ["/usr/bin/java", "-jar", "rbnb.jar"]