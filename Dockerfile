ARG BASE_IMAGE=ubuntu:20.04
FROM $BASE_IMAGE

# SET the basics
ENV DEBIAN_FRONTEND="teletype" \
    LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en" \
    LC_ALL="en_US.UTF-8"


# COPY the build files to the image temporarily
COPY nos-build/ /nos-build

# RUN the build files inside the image
RUN /nos-build/prepare.sh && \
    /nos-build/services.sh && \
    /nos-build/utilities.sh && \
    /nos-build/cleanup.sh

# REMOVE temporary files
RUN rm -rf /nos-build

# REMOVE other unecessary files
RUN rm -rf /etc/update-motd.d

# COPY overlay files
COPY fs_overlay/ / 

CMD ["/sbin/init"]
