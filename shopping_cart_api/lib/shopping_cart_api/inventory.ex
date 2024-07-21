defmodule ShoppingCartApi.Inventory do
  alias ShoppingCartApi.Repo
  alias ShoppingCartApi.Product

  def list_products do
    Repo.all(Product)
  end

  def get_product(id), do: Repo.get(Product, id)

  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  def confirm_purchase(items) do
    Repo.transaction(fn ->
      Enum.each(items, fn %{"id" => id, "quantity" => quantity} ->
        product = get_product(id)

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
