ARG POSTGRES_VERSION=10
FROM postgres:$POSTGRES_VERSION
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    sudo \
    && pip3 install --no-cache-dir certifi \
    && rm -rf /var/lib/apt/lists/*