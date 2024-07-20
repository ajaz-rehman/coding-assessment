# Postgres + PgAdmin

A simple [PostgreSQL](https://www.postgresql.org/) and [pgAdmin4](https://www.pgadmin.org/) setup using Docker.

## Prerequisites

You need the following installed on your machine:

1. [Docker Engine](https://docs.docker.com/engine/)
2. [Docker Compose](https://docs.docker.com/compose/)

### Usage

How To Start:

```shell
docker compose up -d
```

How To Start After Making Changes:

```shell
docker compose up --build -d
```

How To Stop:

```shell
docker compose down
```

How To Stop & Remove Volumes:

```shell
docker compose down -v
```

### pgAdmin4 Dashboard

Open [localhost](http://localhost:80) in your browser.

### pgAdmin4 Credentials

| Key      |       Value       |
| -------- | :---------------: |
| Email    | `admin@gmail.com` |
| Password |    `password`     |

### Database Credentials

| Key      |          Value          |
| -------- | :---------------------: |
| Host     |       `localhost`       |
| Port     |         `5432`          |
| Database | `shopping_cart_api_dev` |
| Username |         `admin`         |
| Password |       `password`        |

**NOTE**: Use `db` as host inside pgAdmin4 server settings.
