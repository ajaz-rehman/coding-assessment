defmodule ShoppingCartApiWeb.InventoryController do
  use ShoppingCartApiWeb, :controller

  alias ShoppingCartApi.Inventory

  def index(conn, _params) do
    products = Inventory.list_products()
    render(conn, :index, products: products)
  end

  def confirm_purchase(conn, %{"items" => items}) do
    if !validate_items(items) do
      conn
      |> put_status(:bad_request)
      |> json(%{error: "Bad request"})
    else
      with {:ok, _} <- Inventory.confirm_purchase(items) do
        json(conn, %{message: "Purchase confirmed"})
      else
        {:error, reason} ->
          put_status(conn, reason)
          |> json(%{error: reason})
      end
    end
  end

  defp validate_items(items) do
    is_list(items) &&
    !Enum.empty?(items) &&
    Enum.all?(items, fn item ->
      is_map(item) && is_integer(item["quantity"]) && item["quantity"] > 0 &&
        is_integer(item["product_id"])
    end)
  end
end
