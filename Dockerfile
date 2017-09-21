FROM mhart/alpine-node:8

# If you have native dependencies, you'll need extra tools
RUN apk add --no-cache make gcc g++ python

# Needed for npm project build
RUN apk add --no-cache zeromq-dev
RUN apk add --no-cache krb5-dev

# Set work directory
WORKDIR /app
