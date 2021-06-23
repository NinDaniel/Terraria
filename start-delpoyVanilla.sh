#!/bin/sh

#You've chosen vanilla! Time to get what version!
case ${VERSION} in
    1.3.3.3)
        DOWNLOAD_URL=https://terraria.org/server/terraria-server-1333.zip
        ;;
    1.3.4.4)
        DOWNLOAD_URL=https://terraria.org/server/terraria-server-1344.zip
        ;;
    1.3.5.3)
        DOWNLOAD_URL=https://terraria.org/server/terraria-server-1353.zip
        ;;
    1.4.0.1)
        DOWNLOAD_URL=https://terraria.org/server/terraria-server-1401.zip
        ;;
    1.4.0.2)
        DOWNLOAD_URL=https://terraria.org/system/dedicated_servers/archives/000/000/036/original/terraria-server-1402.zip
        ;;
    1.4.0.3)
        DOWNLOAD_URL=https://terraria.org/system/dedicated_servers/archives/000/000/037/original/terraria-server-1403.zip
        ;;
    1.4.0.4)
        DOWNLOAD_URL=https://www.terraria.org/system/dedicated_servers/archives/000/000/038/original/terraria-server-1404.zip
        ;;
    1.4.0.5)
        DOWNLOAD_URL=https://www.terraria.org/system/dedicated_servers/archives/000/000/039/original/terraria-server-1405.zip
        ;;
    1.4.1)
        DOWNLOAD_URL=https://www.terraria.org/system/dedicated_servers/archives/000/000/040/original/terraria-server-1410.zip
        ;;
    1.4.1.1)
        DOWNLOAD_URL=https://www.terraria.org/system/dedicated_servers/archives/000/000/041/original/terraria-server-1411.zip
        ;;
    1.4.1.2)
        DOWNLOAD_URL=https://terraria.org/system/dedicated_servers/archives/000/000/042/original/terraria-server-1412.zip
        ;;
    1.4.2)
        DOWNLOAD_URL=https://terraria.org/system/dedicated_servers/archives/000/000/043/original/terraria-server-142.zip
        ;;
    1.4.2.1)
        DOWNLOAD_URL=https://terraria.org/system/dedicated_servers/archives/000/000/044/original/terraria-server-1421.zip
        ;;
    1.4.2.2)
        DOWNLOAD_URL=https://terraria.org/system/dedicated_servers/archives/000/000/045/original/terraria-server-1422.zip
        ;;
    1.4.2.3 | latest)
        DOWNLOAD_URL=https://terraria.org/system/dedicated_servers/archives/000/000/046/original/terraria-server-1423.zip
        ;;
    *)
        log "Could not find a suitable version! Using latest instead!"
        DOWNLOAD_URL=https://terraria.org/system/dedicated_servers/archives/000/000/046/original/terraria-server-1423.zip
esac