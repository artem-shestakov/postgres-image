ARG POSTGRES_VERSION=10
FROM postgres:$POSTGRES_VERSION
RUN apt-get update && apt-get install -y \
    python3 \
    sudo \
    && rm -rf /var/lib/apt/lists/*