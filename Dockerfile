FROM ubuntu:14.04

MAINTAINER cirias

ENV PHANTOMJS_VERSION 2.1.1

RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y wget libfontconfig && \
  wget -q --no-check-certificate -O "/tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2" "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2" && \
  tar -xjf "/tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2" -C /tmp && \
  rm -f "/tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2"  && \
  mv "/tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/" /opt/phantomjs && \
  ln -s /opt/phantomjs/bin/phantomjs /usr/bin/phantomjs && \
  apt-get autoremove -y && \
  apt-get clean all

CMD ["/usr/bin/phantomjs"]
