# Docker-qbittorrent
For Synology Docker qBittorrent
## **Verison**
# Latest: (Supoort IPV6 Tracker)
qBittorrent-4.3.2  (libtorrent-1.2.12)
# v4.2.5:
qBittorrent-4.2.5  (libtorrent-1.2.6)
# v4.2.3:
qBittorrent-4.2.3  (libtorrent-1.2.5)
# v4.2.1:
qBittorrent-4.2.1  (libtorrent-1.2.2)
# v4.2.0:
qBittorrent-4.2.0  (libtorrent-1.1.13)
# v4.1.9.1:
qBittorrent-4.1.9.1  (libtorrent-1.1.13)
# v4.1.9:
qBittorrent-4.1.9  (libtorrent-1.1.13)
# v4.1.8:
qBittorrent-4.1.8  (libtorrent-1.1.13)
# v4.1.6:
qBittorrent-4.1.6  (libtorrent-1.1.13)
# v4.1.5:
qBittorrent-4.1.5  (libtorrent-1.1.11)
# v4.1.0:
qBittorrent-4.1.0  (libtorrent-1.1.7)
# v4.0.4:
qBittorrent-4.0.4  (libtorrent-1.0.11)
# v3.3.11:
qBittorrent-3.3.11 (libtorrent-1.0.11)

## ![#f03c15](https://fi.madjack.info/red.png) **for Linux：**
`docker run -itd \`
`--name=(container name) \`
`-p 54321:54321/tcp \`
`-p 54321:54321/udp \`
`-p 56789:56789/tcp \`
`-v (path to downloads):/downloads \`
`madjack/qbittorrent`

## ![#1589F0](https://fi.madjack.info/blue.png) **for Synology DSM：**
設定Synoogy Nas本機資料夾對應到容器的資料夾 /downloads
Port 56789 / TCP (Webui Port，Nas本機Port與容器Port需設定同為56789才能順利開啟WebUI)
54321 / TCP (Connect Port)
54321 / UDP (Connect Port)

The WebUI running on **http://localhost:56789**

default user:**admin**

default password:**adminadmin**
