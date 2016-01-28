FROM node:4-slim
RUN npm install -g @panosoft/chronicle-server@"^0.1.0"
EXPOSE 8443
CMD ["chronicle-server", "--key", "/credentials/server.key", "--cert", "/credentials/server.crt", "--port", "8443"]
