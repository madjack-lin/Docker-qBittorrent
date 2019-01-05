From centos:7.6.1810
    # buildDeps config
RUN yum -y update && \
    yum -y groupinstall "Development Tools"
RUN buildDeps='wget qt-devel boost-devel openssl-devel qt5-qtbase-devel qt5-linguist' && \
    yum -y install $buildDeps && \
    yum -y install centos-release-scl-rh devtoolset-3-gcc devtoolset-3-gcc-c++ && \
    source scl_source enable devtoolset-3
    # Build libtorrent 1.1.11
RUN wget https://github.com/arvidn/libtorrent/releases/download/libtorrent_1_1_11/libtorrent-rasterbar-1.1.11.tar.gz && \   
    tar xzvf libtorrent-rasterbar-1.1.11.tar.gz && \
    cd libtorrent-rasterbar-1.1.11 && \
    ./configure --prefix=/usr CXXFLAGS=-std=c++11 && \
    make clean && \
    make -j$(nproc) && \
    make install && \
    ln -s /usr/lib/pkgconfig/libtorrent-rasterbar.pc /usr/lib64/pkgconfig/libtorrent-rasterbar.pc && \
    ln -s /usr/lib/libtorrent-rasterbar.so.9 /usr/lib64/libtorrent-rasterbar.so.9 && \
    cd .. && \
    # Download qBittorrent 4.1.5
    ldconfig && \
    wget https://github.com/qbittorrent/qBittorrent/archive/release-4.1.5.tar.gz && \
    tar -xzvf release-4.1.5.tar.gz && \
    cd qBittorrent-release-4.1.5/ && \
    ./configure --prefix=/usr --disable-gui CPPFLAGS=-I/usr/include/qt5 && \
    make -j$(nproc) && \
    make install && \
    cd .. && \
    # Clean up & mkdir folder
    rm -f *.gz && \
    rm -rf /libtorrent-rasterbar-1.1.11 && \
    rm -rf /qBittorrent-release-4.1.5
    # Add Config File
COPY qBittorrent.conf /root/.config/qBittorrent/
VOLUME ["/downloads"]
EXPOSE 56789 54321
CMD ["qbittorrent-nox"]
