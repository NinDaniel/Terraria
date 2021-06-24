FROM mono:6.12.0.107-slim AS base
LABEL org.opencontainers.image.authors="ninxdaniel@gmail.com"
LABEL version=1.0

# Install utilities
RUN apt-get update && \
    apt-get install -y curl zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set some default environment variables
ENV UID=1000 GID=1000 \
    TYPE=VANILLA VERSION=LATEST \
    PORT=7777

EXPOSE ${PORT}/tcp

# Creates the user
RUN addgroup --gid 1000 terraria && \
    adduser --system --shell /bin/false --uid 1000 --ingroup terraria --home /$(echo ${TYPE} | tr [:upper:] [:lower:]) terraria

WORKDIR /tmp/

# Copy all additional setup scripts
COPY start* .
COPY files .
RUN chmod +x /tmp/start*

# Allow custom config and worlds
VOLUME [ "/config" ]

# Let the magic begin!
ENTRYPOINT [ "./start" ]