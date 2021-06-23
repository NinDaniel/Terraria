#!/bin/sh

#Checks to see if

#Functions for setting the server properties
function setServerProp {
    local prop=$1
    local var=$2
    if [ -n "$var" ]; then
        #
        case ${var} in
            TRUE|FALSE)
                var=${var,,} ;;
        esac
        if grep "${prop}" "$SERVER_CONFIG" > /dev/null; then
            log "Setting ${prop} to '${var}' in ${SERVER_CONFIG}"
            sed -i "/^${prop}\s*=/ c ${prop}=${var//\\/\\\\}" "$SERVER_CONFIG"
        else
            log "Adding ${prop} with '${var}' in ${SERVER_CONFIG}"
            echo "${prop}=${var//\\/\\\\}" >> "$SERVER_CONFIG"
        fi
    fi
}

setServerProp "world" "$WORLD"
setServerProp "autocreate" "$AUTOCREATE"
setServerProp "seed" "$SEED"
setServerProp "worldname" "$WORLDNAME"
setServerProp "difficulty" "$DIFFICULTY"
setServerProp "maxplayers" "$MAXPLAYERS"
setServerProp "port" "$PORT"
setServerProp "password" "$PASSWORD"
setServerProp "motd" "$MOTD"
setServerProp "worldpath" "$WORLDPATH"
setServerProp "banlist" "$BANLIST"
setServerProp "secure" "$SECURE"
setServerProp "language" "$LANGUAGE"
#Available languages are 
# en/US = English
# de/DE = German
# it/IT = Italian
# fr/FR = French
# es/ES = Spanish
# ru/RU = Russian
# zh/Hans = Chinese
# pt/BR = Portuguese
# pl/PL = Polish
setServerProp "upnp" "$UPNP"
setServerProp "npcstream" "$NPCSTREAM"
setServerProp "priority" "$PRIORITY"
#Journey Mode powers
setServerProp "journeypermission_time_setfrozen" "$JOURNEYPERMISSION_TIME_SETFROZEN"
setServerProp "journeypermission_time_setdawn" "$JOURNEYPERMISSION_TIME_SETDAWN"
setServerProp "journeypermission_time_setnoon" "$JOURNEYPERMISSION_TIME_SETNOON"
setServerProp "journeypermission_time_setdusk" "$JOURNEYPERMISSION_TIME_SETDUSK"
setServerProp "journeypermission_time_setmidnight" "$JOURNEYPERMISSION_TIME_SETMIDNIGHT"
setServerProp "journeypermission_godmode" "$JOURNEYPERMISSION_GODMODE"
setServerProp "journeypermission_wind_setstrength" "$JOURNEYPERMISSION_WIND_SETSTRENGTH"
setServerProp "journeypermission_rain_setstrength" "$JOURNEYPERMISSION_RAIN_SETSTRENGTH"
setServerProp "journeypermission_time_setspeed" "$JOURNEYPERMISSION_TIME_SETSPEED"
setServerProp "journeypermission_rain_setfrozen" "$JOURNEYPERMISSION_RAIN_SETFROZEN"
setServerProp "journeypermission_wind_setfrozen" "$JOURNEYPERMISSION_WIND_SETFROZEN"
setServerProp "journeypermission_increaseplacementrange" "$JOURNEYPERMISSION_INCREASEPLACEMENTRANGE"
setServerProp "journeypermission_setdifficulty" "$JOURNEYPERMISSION_SETDIFFICULTY"
setServerProp "journeypermission_biomespread_setfrozen" "$JOURNEYPERMISSION_BIOMESPREAD_SETFROZEN"
setServerProp "journeypermission_setspawnrate" "$JOURNEYPERMISSION_SETSPAWNRATE"

cat "/data/serverconfig.txt"