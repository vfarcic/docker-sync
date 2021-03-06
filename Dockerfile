FROM gliderlabs/alpine:3.1
MAINTAINER Viktor Farcic "viktor@farcic.com"

RUN apk --update add bash lsyncd openssh
#RUN apk --update add lsyncd ssh
COPY run.sh /run.sh
RUN mkdir /data

CMD ["/run.sh"]

ENV DESTINATION_HOST my_host
ENV DESTINATION_DIR /data
ENV SOURCE_DIRECTORY /data
