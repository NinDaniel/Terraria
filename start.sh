#!/bin/sh

. ${SCRIPTS:-/}start-utils

#Sets the perms
umask 0002
chmod g+w /${TYPE}
chmod g+w /config

if [ $UID != 0 ]; then
    if [ $UID != $(id -u terraria) ]; then
        log "Changing uid of terraria to $UID"
        usermod -u $UID terraria
    fi
fi

if [ $GID != 0 ]; then
    if [ $UID != $(id -g terraria) ]; then
        log "Changing gid of terraria to $GID"
        groupmod -o -g $GID terraria
    fi
fi

if [ $(stat -c "%u" /config) != $UID ]; then
    log "Changing ownership of /config to $UID"
    chown -R terraria:terraria /config
fi

case $(echo $TYPE | tr [:upper:] [:lower]) in
    tshock)
        exec start-deployTShock.sh
        ;;
    modded)
        exec start-deployModded.sh
        ;;
    vanilla | *)
        exec start-deployVanilla.sh
        ;;
esac