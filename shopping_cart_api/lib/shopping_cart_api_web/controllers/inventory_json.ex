defmodule ShoppingCartApiWebWeb.ProductJSON do
  alias ShoppingCartApi.Product

  def index(%{products: products}) do
    %{data: for(product <- products, do: data(product))}
  end

  def data(%Product{} = product) do
    %{
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      quantity: product.quantity
    }
  end
end
