# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ShoppingCartApi.Repo.insert!(%ShoppingCartApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias ShoppingCartApi.Repo
alias ShoppingCartApi.Product

products = [
  %{name: "Laptop", description: "High-performance laptop", price: 999.99, quantity: 10},
  %{name: "Smartphone", description: "Latest model smartphone", price: 599.99, quantity: 20},
  %{name: "Headphones", description: "Noise-cancelling headphones", price: 199.99, quantity: 30},
  %{name: "Tablet", description: "10-inch tablet", price: 299.99, quantity: 15},
  %{name: "Smartwatch", description: "Fitness smartwatch", price: 149.99, quantity: 25},
  %{name: "Camera", description: "High-quality camera", price: 399.99, quantity: 5},
  %{name: "Printer", description: "Wireless printer", price: 149.99, quantity: 10},
  %{name: "Monitor", description: "27-inch monitor", price: 299.99, quantity: 10},
  %{name: "Keyboard", description: "Mechanical keyboard", price: 99.99, quantity: 20},
  %{name: "Mouse", description: "Wireless mouse", price: 49.99, quantity: 30},
]

Enum.each(products, fn product ->
  %Product{}
  |> Product.changeset(product)
  |> Repo.insert!()
end)
