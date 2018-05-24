FROM ubuntu
RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
        ca-certificates \
        build-essential \
        libsodium-dev \
        npm \
        curl \
        wget \
        git \
    && rm -rf /var/lib/apt/lists/*
RUN wget -O- https://raw.githubusercontent.com/aliyun-node/tnvm/master/install.sh | bash
RUN RUN source $HOME/.bashrc \ 
    && tnvm install “alinode-v1.9.7”
    && tnvm use "alinode-v1.9.7" \
ADD . /ulord-node-stratum-pool
WORKDIR /ulord-node-stratum-pool
RUN npm update
CMD ["npm","start"]