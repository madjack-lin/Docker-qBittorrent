From ubuntu:16.04
    # buildDeps config
RUN buildDeps='build-essential pkg-config automake libtool git wget libboost-dev libboost-system-dev libboost-chrono-dev libboost-random-dev libssl-dev libgeoip-dev qtbase5-dev qttools5-dev-tools libqt5svg5-dev python' && \
    apt-get update && \
    apt-get install geoip-database $buildDeps -y && \
    # Build libtorrent 1.0.11
    wget https://github.com/arvidn/libtorrent/releases/download/libtorrent-1_0_11/libtorrent-rasterbar-1.0.11.tar.gz && \   
    tar xzvf libtorrent-rasterbar-1.0.11.tar.gz && \
    cd libtorrent-rasterbar-1.0.11 && \
    ./configure --prefix=/usr --disable-debug --enable-encryption --with-libgeoip=system CXXFLAGS=-std=c++11 && \
    make clean && \
    make -j$(nproc) && \
    make install && \
    cd .. && \
    # Download qBittorrent 3.3.11
    ldconfig && \
    wget https://github.com/qbittorrent/qBittorrent/archive/release-3.3.11.tar.gz && \
    tar -xzvf release-3.3.11.tar.gz && \
    cd qBittorrent-release-3.3.11/ && \
    ./configure --prefix=/usr --disable-gui && \
    make -j$(nproc) && \
    make install && \
    cd .. && \
    # Clean up & mkdir folder
    apt-get purge -y $buildDeps && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf *.gz && \
    rm -rf /libtorrent-rasterbar-1.0.11 && \
    rm -rf /qBittorrent-release-3.3.11
    # Add Config File
COPY qBittorrent.conf /root/.config/qBittorrent/
VOLUME ["/downloads"]
EXPOSE 56789 54321
CMD ["qbittorrent-nox"]
