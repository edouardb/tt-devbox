FROM ghcr.io/tenstorrent/tt-metal/tt-metalium/ubuntu-22.04-amd64:dev-nardo-tile_sharded

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libc6 \
    libstdc++6 \
    curl \
    bash \
    git \
    sudo && \
    rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' | tar -xz -C /usr/local/bin

WORKDIR /workdir

ENV VSC_NODE_NAME=${VSC_NODE_NAME:-tt-n300s-on-koyeb}

CMD code tunnel --name "$VSC_NODE_NAME" --accept-server-license-terms
