# Chronicle Server

> Official Docker Image Build Context for [`chronicle-server`](https://github.com/panosoft/chronicle-server)

## Usage

Ports:
- `8443` - HTTPS Chronicle server

Volumes:

- `/credentials:ro`
  - `server.key` - A private TLS key in PEM format.
  - `server.crt` - A public TLS certificate in PEM format.
