# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM phusion/baseimage:0.11

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...
RUN apt-get update
# RUN apt-get -y upgrade -o Dpkg::Options::="--force-confold"
# RUN apt-get -y install unzip libcurl4 curl

# Clean up apt-get when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd -ms /bin/bash bedrock

EXPOSE 19132/udp

COPY bedrock_server /home/bedrock/bedrock_server
RUN mkdir -p /home/bedrock/bedrock_server/worlds
RUN chown -R bedrock:bedrock /home/bedrock/bedrock_server

# If you enable the USER below, there will be permission issues with shared volumes
USER bedrock

ENTRYPOINT cd /home/bedrock/bedrock_server && LD_LIBRARY_PATH=. ./bedrock_server
