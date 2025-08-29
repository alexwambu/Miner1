FROM ubuntu:20.04

# Non-interactive install
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y wget tar && \
    rm -rf /var/lib/apt/lists/*

# Download XMRig lightweight build
RUN wget https://github.com/xmrig/xmrig/releases/download/v6.21.3/xmrig-6.21.3-linux-x64.tar.gz && \
    tar -xzf xmrig-6.21.3-linux-x64.tar.gz && \
    mv xmrig-6.21.3 xmrig && \
    rm xmrig-6.21.3-linux-x64.tar.gz

WORKDIR /xmrig

# Copy your config
COPY config.json .

CMD ["./xmrig", "-c", "config.json"]
