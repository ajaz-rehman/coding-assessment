defmodule ShoppingCartApiWeb.InventoryController do
  use ShoppingCartApiWeb, :controller

  alias ShoppingCartApi.Inventory

  def index(conn, _params) do
    products = Inventory.list_products()
    render(conn, :index, products: products)
  end

  def confirm_purchase(conn, %{"items" => items}) do
    if Enum.empty?(items) do
      conn
      |> put_status(:bad_request)
      |> json(%{message: "Items list cannot be empty"})
    else
      with {:ok, _} <- Inventory.confirm_purchase(items) do
        json(conn, %{message: "Purchase confirmed"})
      end
    end
  end
end
