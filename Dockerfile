FROM centos:6

ADD http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm epel-release-6-8.noarch.rpm
COPY gnash-0.8.8 gnash-0.8.8

RUN rpm -ivh epel-release-6-8.noarch.rpm; \
  yum install -y gcc-c++ \
    SDL-devel \
    agg-devel \
    boost-devel \
    gstreamer-devel \
    gstreamer-plugins-base-devel \
    libjpeg-devel \
    libpng-devel \
    libungif-devel; \
  yum -y clean all;

RUN cd gnash-0.8.8; \
  ./configure --enable-renderer=agg --enable-gui=dump --disable-kparts --disable-nsapi --disable-menus; \
    make; \
    make install; \
    rm -rf /gnash-0.8.8;

RUN echo set localSandboxPath /tmp > /root/.gnashrc

RUN yum remove -y gcc-c++ \
    SDL-devel \
    agg-devel \
    boost-devel \
    gstreamer-devel \
    gstreamer-plugins-base-devel \
    libjpeg-devel \
    libpng-devel \
    libungif-devel; \
  yum -y clean all; \
  yum autoremove

# ENTRYPOINT ["dump-gnash"]
