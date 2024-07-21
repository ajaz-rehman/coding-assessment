defmodule ShoppingCartApiWeb.InventoryControllerConfirmPurchaseTest do
  use ShoppingCartApiWeb.ConnCase
  alias ShoppingCartApi.Inventory

  @base_url "/api/inventory/confirm_purchase"

  @empty_args %{
    "items" => []
  }

  @invalid_args %{
    "items" => [
      %{"id" => 1, "quantity" => 0}
    ]
  }

  @valid_args %{
    "items" => [
      %{"id" => 1, "quantity" => 1}
    ]
  }

  @valid_products [
    %{name: "Test Product", description: "A test product", price: 9.99, quantity: 10},
    %{name: "Test Product 2", description: "Another test product", price: 19.99, quantity: 5}
  ]

  def insert_products(products) do
    Enum.map(products, &Inventory.create_product(&1))
  end

  describe "confirm_purchase" do
    test "no arguments", %{conn: conn} do
      conn = post(conn, @base_url, @empty_args)
      response = json_response(conn, 400)
      assert Map.has_key?(response, "error")
    end

    test "product not in database", %{conn: conn} do
      conn = post(conn, @base_url, @valid_args)
      response = json_response(conn, 404)
      assert Map.has_key?(response, "error")
    end
  end
end
