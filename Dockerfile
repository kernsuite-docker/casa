from kernsuite/base:1
MAINTAINER gijs@pythonic.nl

RUN docker-apt-install libfreetype6 libsm6 libxi6 libxrender1 libxrandr2 libxfixes3 \
        libxcursor1 libxinerama1 libfontconfig1  libxslt1.1 xauth xvfb dbus-x11 python-tk

# setup all required env variables
ARG VERSION
ENV VERSION=${VERSION}
ENV RELEASE=casa-release-${VERSION}-el6
ENV USER root
ENV HOME /root
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/${RELEASE}/bin

# copy casas databundle to container
ADD ${RELEASE}.tar.gz /
RUN ln -s ${RELEASE} /casa

## copy empty casas config
RUN rm -rf /root
ADD root /root

WORKDIR /${RELEASE}/bin
CMD ["casa"]

