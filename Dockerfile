FROM walm/base:0.1.1
MAINTAINER Andreas Wålm "andreas@walm.net"

RUN \
  echo "# Installing nginx" ;\
  apt-get update -qq ;\
  apt-get install -qq -y software-properties-common ;\
  add-apt-repository -y ppa:nginx/stable ;\
  apt-get -qq -y install nginx ;\
  echo "daemon off;" >> /etc/nginx/nginx.conf ;\
  chown -R app:app /var/log/nginx ;\
  \
  echo "# Clean up" ;\
  apt-get remove -qq -y software-properties-common ;\
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /setup /build

ADD nginx.sh /etc/service/nginx/run

# VOLUME ["/etc/nginx", "/usr/share/nginx/html"]

EXPOSE 80
EXPOSE 443
