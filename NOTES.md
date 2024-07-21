# Design Decisions

I tried to keep the application simple and easy to understand.

## Database

1. Used `docker-compose` to allow setting up a Postgres server quickly without setting up anything.
2. Added `pgAdmin` to make it easier to see the database.
3. Used `env variables` so anyone can change the credentials without updating the docker file.

## Backend

1. Created a Repo named `Inventory` to offer database functions.
2. Created a Schema named `Product` and its migrations using ecto.
3. Created a Controller named `InventoryController` to handle routes.
4. Created one endpoint to get the products and another to purchase items.
5. Registered both routes in the `router` file.
6. Added a `seed` file for the database.
7. Added `custom scripts` inside the mix file to provide easy access to utility functions.
8. Added automated tests for both endpoints.

## Frontend

1. Created a basic `VueJS` application using Vite since it is the best tool for building small Vue applications.
2. Used `TailwindCSS` and `TypeScript` in the project.
3. Divided the components into several categories based on
   [Atomic Design System](https://bradfrost.com/blog/post/atomic-web-design).
4. Used refs to handle the `state` of the application because any dedicated state management library would be overkill
   for such a small application.
5. I did not use any `UI library` to showcase how I implement components and manage their states.
