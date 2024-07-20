defmodule ShoppingCartApiWeb.InventoryController do
  use ShoppingCartApiWeb, :controller

  alias ShoppingCartApi.Inventory

  def index(conn, _params) do
    products = Inventory.list_products()
    render(conn, :index, products: products)
  end

  def confirm_purchase(conn, %{"items" => items}) do
    case Inventory.confirm_purchase(items) do
      {:ok, _} ->
        send_resp(conn, :ok, "Purchase confirmed")
      {:error, reason} ->
        send_resp(conn, :unprocessable_entity, reason)
    end
  end
end
