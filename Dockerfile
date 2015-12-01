FROM resin/rpi-raspbian:wheezy
MAINTAINER Markus Fix <lispmeister@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install build-essential -y && \
    apt-get install distcc -y && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 3632 
ENTRYPOINT ["/usr/bin/distccd"]
CMD ["--no-detach", "--log-stderr", "--verbose", "-a", "0.0.0.0/0"]
