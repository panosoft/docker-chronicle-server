FROM debian:jessie

# Install utilities
RUN apt-get update && apt-get install --assume-yes \
    wget \
    git \
    make \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install node
ENV NODE_VERSION=4.2.6
RUN git clone https://github.com/tj/n.git n \
  && cd n \
  && make install \
  && n $NODE_VERSION

# Install server
ENV CHRONICLE_SERVER_VERSION=0.1.1
RUN npm install -g @panosoft/chronicle-server@$CHRONICLE_SERVER_VERSION

EXPOSE 8443

CMD ["chronicle-server", "--key", "/credentials/server.key", "--cert", "/credentials/server.crt", "--port", "8443"]
