# Shopping Cart REST API

## Initial Setup

Setup:

```shell
mix setup
```

Running Server:

```shell
mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Other Commands

Running Tests:

```shell
mix test
```

Resetting Database:

```shell
mix ecto.reset
```

## Endpoints

Get Products:

```shell
GET /api/inventory/products
```

Confirm Purchase:

```shell
POST /api/inventory/confirm_purchase
```
