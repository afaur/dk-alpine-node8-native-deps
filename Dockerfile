FROM mhart/alpine-node:8

# If you have native dependencies, you'll need extra tools
RUN apk add --no-cache make gcc g++ python

# Needed for npm project build
RUN apk add --no-cache zeromq-dev
RUN apk add --no-cache krb5-dev

# Clean up caches/docs
RUN rm -rf                            \
    /var/lib/apt/lists/*              \
    /var/cache/apk/*                  \
    /usr/share/man                    \
    /tmp/*                            \
    /usr/lib/node_modules/npm/man     \
    /usr/lib/node_modules/npm/doc     \
    /usr/lib/node_modules/npm/html    \
    /usr/lib/node_modules/npm/scripts

# Set work directory
WORKDIR /app
