FROM mono:6.12.0.107-slim AS base
LABEL org.opencontainers.image.authors="ninxdaniel@gmail.com"

#Install utilities
RUN apt-get update && \
    apt-get install -y curl zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#Set some default environment variables
ENV UID=1000 GID=1000 \
    TYPE=VANILLA VERSION=LATEST \
    PORT=7777

EXPOSE ${PORT}

#Download Terraria vanilla server
RUN addgroup --gid 1000 terraria && \
    TYPE=$(echo $TYPE | tr [:upper:] [:lower:]) && \
    adduser --system --shell /bin/false --uid 1000 --ingroup terraria --home /${TYPE} terraria 

#Copy all additional setup scripts
COPY . /
RUN chmod +x /start*

#Allow custom config and worlds
VOLUME [ "/config" ]

#Let the magic begin!
WORKDIR /${TYPE}
ENTRYPOINT [ "./start" ]