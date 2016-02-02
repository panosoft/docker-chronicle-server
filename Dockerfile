FROM debian:jessie

# Install utilities
RUN apt-get update && apt-get install --assume-yes \
    wget \
    git \
    make \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install node
RUN git clone https://github.com/tj/n.git n \
  && cd n \
  && make install \
  && n 4.*

# Install @panosoft/chronicle-server
RUN npm install -g @panosoft/chronicle-server@"^0.1.0"

EXPOSE 8443

CMD ["chronicle-server", "--key", "/credentials/server.key", "--cert", "/credentials/server.crt", "--port", "8443"]
