Inception — User guide

This repository deploys a small stack with three services:

- WordPress : the PHP application
- Nginx : reverse proxy and TLS termination
- MariaDB : the database


Make sure docker and docker compose is installed and make as well.

## Quick start

From the project root build and start the stack with:

```bash
make
```

Stop the services:

```bash
make clean
```

Remove volumes (data will be deleted):

```bash
make fclean
```

Remove ALL docker resources:

```bash
make sprune
```

## Access the site

After the services start, open a browser to:

- https://dmazari.42.fr — WordPress site
- https://dmazari.42.fr/wp-admin — WordPress admin
- https://dmazari.42.fr/wp-user — user login

Credentials are configured via environment files.

## Inspect status and logs

- Show container status:

```bash
make ps
```

- See logs for all services:

```bash
make logs
```

## Locate and manage the credentials

All the credentials are in the .env.