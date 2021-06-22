FROM mono:6.12.0.107-slim AS base
#Install utilities
RUN apt-get update && \
    apt-get install -y curl nuget zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#Download Terraria vanilla server
RUN addgroup --gid 1000 terraria && \
    adduser --system --shell /bin/false --uid 1000 --ingroup terraria --home /vanilla terraria 

#Copy all additional setup scripts
COPY . .

#Allow custom config and worlds
VOLUME [ "/config" ]

#Set some default environment variables
EXPOSE 7777
ENV UID=1000 GID=1000 \
    TYPE=VANILLA VERSION LATEST

#Let the magic begin!
WORKDIR /vanilla
ENTRYPOINT [ "./start.sh" ]