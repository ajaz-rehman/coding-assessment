defmodule ShoppingCartApiWeb.InventoryControllerTest do
  use ShoppingCartApiWeb.ConnCase
  alias ShoppingCartApi.Inventory

  @products_url "/api/inventory/products"

  @valid_attrs %{name: "Test Product", description: "A test product", price: 9.99, quantity: 10}
  @update_attrs %{
    name: "Updated Product",
    description: "An updated product",
    price: 19.99,
    quantity: 20
  }
  @invalid_attrs %{name: nil, description: nil, price: nil, quantity: nil}

  describe @products_url do
    test "get products when there's none", %{conn: conn} do
      conn = get(conn, @products_url)
      assert json_response(conn, 200)["data"] == []
    end
  end
end
