defmodule ShoppingCartApiWeb.InventoryControllerTest do
  use ShoppingCartApiWeb.ConnCase

  @products_url "/api/inventory/products"

  @valid_attrs %{name: "Test Product", description: "A test product", price: 9.99, quantity: 10}
  @update_attrs %{name: "Updated Product", description: "An updated product", price: 19.99, quantity: 20}
  @invalid_attrs %{name: nil, description: nil, price: nil, quantity: nil}

  describe @products_url do
    test "get products", %{conn: conn} do
      conn = get(conn, @products_url)
      assert json_response(conn, 200)["data"] == []
    end
  end

end
