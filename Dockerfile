FROM mhart/alpine-node:8

# If you have native dependencies, you'll need extra tools
RUN apk add --no-cache make gcc g++ python

# Needed for npm project build
RUN apk add --no-cache zeromq-dev
RUN apk add --no-cache krb5-dev

# Include for headless chrome
RUN apk -U              \
  --no-cache            \
  --allow-untrusted add \
    zlib-dev            \
    chromium            \
    xvfb                \
    wait4ports          \
    xorg-server         \
    dbus                \
    ttf-freefont        \
    mesa-dri-swrast     \
    grep                \
    udev

# Clean up pkgs
RUN apk del                           \
  --purge --force linux-headers       \
    binutils-gold gnupg zlib-dev      \
    libc-utils

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

# Port for remote chrome
EXPOSE 9222

# Set work directory
WORKDIR /app
