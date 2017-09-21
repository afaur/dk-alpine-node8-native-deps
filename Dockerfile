FROM mhart/alpine-node:8

# If you have native dependencies, you'll need extra tools
RUN apk add --no-cache make gcc g++ python

# Set work directory
WORKDIR /app
