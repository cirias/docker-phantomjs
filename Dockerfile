FROM ubuntu:14.04

MAINTAINER cirias

ENV PHANTOMJS_VERSION 2.1.1
ENV CASPERJS_VERSION 1.1.3

RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y wget libfontconfig git python && \
  apt-get autoremove -y && \
  apt-get clean all

RUN \
  wget -q --no-check-certificate -O "/tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2" "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2" && \
  tar -xjf "/tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2" -C /tmp && \
  rm -f "/tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2"  && \
  mv "/tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/" /opt/phantomjs && \
  ln -s /opt/phantomjs/bin/phantomjs /usr/bin/phantomjs

RUN \
  wget -q --no-check-certificate -O "/tmp/casperjs-$CASPERJS_VERSION.tar.gz" "https://github.com/casperjs/casperjs/archive/$CASPERJS_VERSION.tar.gz" && \
  tar -xzf "/tmp/casperjs-$CASPERJS_VERSION.tar.gz" -C /tmp && \
  rm -f "/tmp/casperjs-$CASPERJS_VERSION.tar.gz" && \
  mv "/tmp/casperjs-$CASPERJS_VERSION" /opt/casperjs && \
  ln -s /opt/casperjs/bin/casperjs /usr/bin/casperjs

CMD ["/usr/bin/phantomjs"]
