defmodule ShoppingCartApiWeb.InventoryControllerConfirmPurchaseTest do
  use ShoppingCartApiWeb.ConnCase
  alias ShoppingCartApi.Inventory

  @base_url "/api/inventory/confirm_purchase"

  @valid_args %{
    "items" => [
      %{"id" => 1, "quantity" => 1},
      %{"id" => 2, "quantity" => 2}
    ]
  }

  describe "confirm_purchase" do
    test "no arguments", %{conn: conn} do
      # conn = post(conn, @base_url)
      # response = json_response(conn, 400)
      # IO.inspect(response)
    end
  end
end
