From ubuntu:18.04
    # buildDeps config
RUN buildDeps='build-essential pkg-config automake libtool git wget libboost-dev libboost-system-dev libboost-chrono-dev libboost-random-dev libssl-dev libgeoip-dev qtbase5-dev qttools5-dev-tools libqt5svg5-dev python' && \
    apt-get update && \
    apt-get install geoip-database zlib1g zlib1g-dev $buildDeps -y && \
    # Build libtorrent 1.2.2
    wget https://github.com/arvidn/libtorrent/releases/download/libtorrent-1_2_2/libtorrent-rasterbar-1.2.2.tar.gz && \
    tar xzvf libtorrent-rasterbar-1.2.2.tar.gz && \
    cd libtorrent-rasterbar-1.2.2 && \
    ./configure --prefix=/usr --disable-debug --enable-encryption --with-libgeoip=system && \
    make clean && \
    make -j$(nproc) && \
    make install && \
    cd .. && \
    # Download qBittorrent 4.2.0
    ldconfig && \
    wget http://us.madjack.info/releasefix-4.2.0.tar.gz && \
    tar -xzvf release-4.2.0.tar.gz && \
    cd qBittorrent-release-4.2.0/ && \
    ./configure --prefix=/usr --disable-gui && \
    make -j$(nproc) && \
    make install && \
    cd .. && \
    # Clean up & mkdir folder
    apt-get purge -y $buildDeps && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf *.gz && \
    rm -rf /libtorrent-rasterbar-1.2.2 && \
    rm -rf /qBittorrent-release-4.2.0
    # Add Config File
COPY qBittorrent.conf /root/.config/qBittorrent/
VOLUME ["/downloads"]
EXPOSE 56789 54321
ENV LANG C.UTF-8
CMD ["qbittorrent-nox"]
