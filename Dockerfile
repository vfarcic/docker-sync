FROM debian:wheezy
MAINTAINER Viktor Farcic "viktor@farcic.com"

RUN apt-get update
RUN apt-get install -y lsyncd ssh
COPY run.sh /run.sh

RUN mkdir /data
ENV DESTINATION_HOST my_host
ENV DESTINATION_DIR /data

CMD ["/run.sh"]