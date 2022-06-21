ARG POSTGRES_VERSION=10-alpine
FROM postgres:$POSTGRES_VERSION
RUN apk add --no-cache python3