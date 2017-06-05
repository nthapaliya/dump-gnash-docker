FROM centos:6

ADD http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm epel-release-6-8.noarch.rpm
COPY gnash-0.8.8 gnash-0.8.8

RUN rpm -ivh epel-release-6-8.noarch.rpm; \
  yum install -y gcc-c++                  \
    agg-devel                             \
    boost-devel                           \
    gstreamer-devel                       \
    gstreamer-plugins-base-devel          \
    libjpeg-devel                         \
    libpng-devel                          \
    libungif-devel;                       \
  yum -y clean all;                       \
  cd gnash-0.8.8;                         \
  ./configure                             \
    --disable-extensions                  \
    --disable-menus                       \
    --disable-npapi                       \
    --disable-plugins                     \
    --disable-sound                       \
    --enable-allstatic                    \
    --enable-gui=dump                     \
    --enable-media=none                   \
    --enable-renderer=agg;                \
  make;                                   \
  make install;                           \
  rm -rf /gnash-0.8.8;                    \
  echo set localSandboxPath /tmp > /root/.gnashrc;

# ENTRYPOINT ["dump-gnash"]
