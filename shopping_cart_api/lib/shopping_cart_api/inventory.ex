defmodule ShoppingCartApi.Inventory do
  @moduledoc """
  Inventory module

  This module is responsible for managing the inventory of products.

  ## Examples

      iex> ShoppingCartApi.Inventory.list_products()
      [%Product{}, %Product{}]

      iex> ShoppingCartApi.Inventory.confirm_purchase([%{"product_id" => 1, "quantity" => 5}])
      :ok
  """
  alias ShoppingCartApi.Repo
  alias ShoppingCartApi.Product

  @doc """
  List all products

  ## Examples

      iex> ShoppingCartApi.Inventory.list_products()
      [%Product{}, %Product{}]
  """
  def list_products do
    Repo.all(Product)
  end

  @doc """
  Get a product by id

  ## Examples

      iex> ShoppingCartApi.Inventory.get_product(1)
      %Product{}
  """
  def get_product(id), do: Repo.get(Product, id)

  @doc """
  Create a product

  ## Examples

      iex> ShoppingCartApi.Inventory.create_product(%{name: "Product 1", quantity: 10})
      %Product{}
  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Update a product

  ## Examples

      iex> ShoppingCartApi.Inventory.update_product(%Product{}, %{quantity: 5})
      %Product{}
  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """

  Delete a product

  ## Examples

      iex> ShoppingCartApi.Inventory.delete_product(%Product{})
      :ok
  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Confirm purchase

  ## Examples

      iex> ShoppingCartApi.Inventory.confirm_purchase([%{"product_id" => 1, "quantity" => 5}])
      :ok
  """
  def confirm_purchase(items) do
    Repo.transaction(fn ->
      Enum.each(items, fn %{"product_id" => product_id, "quantity" => quantity} ->
        product = get_product(product_id)

        if product == nil do
          Repo.rollback(:not_found)
        end

        new_quantity = product.quantity - quantity

        if new_quantity < 0 do
          Repo.rollback(:forbidden)
        else
          update_product(product, %{quantity: new_quantity})
        end
      end)
    end)
  end
end
