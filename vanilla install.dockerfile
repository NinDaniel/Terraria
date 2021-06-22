    mkdir /tmp/terraria && \
    cd /tmp/terraria && \
    curl -sL https://www.terraria.org/system/dedicated_servers/archives/000/000/046/original/terraria-server-1423.zip --output terraria-server.zip && \
    unzip -q terraria-server.zip && \
    mv */Linux /vanilla && \
    #Technically this isn't needed because we will by default make our own sconfig but might as well keep it for backup purposes
    mv */Windows/serverconfig.txt /vanilla/serverconfig-default.txt && \
    rm -R /tmp/* && \
    chmod +x /vanilla/TerrariaServer* && \
    if [ ! -f /vanilla/TerrariaServer ]; then echo "Install failed, missing TerrariaServer"; exit 1; fi