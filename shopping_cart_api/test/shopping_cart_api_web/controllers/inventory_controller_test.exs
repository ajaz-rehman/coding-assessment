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

  defp insert_product(attrs) do
    {:ok, product} = Inventory.create_product(attrs)
    product
  end

  describe "products" do
    test "get products when empty", %{conn: conn} do
      conn = get(conn, @products_url)
      response = json_response(conn, 200)["data"]
      assert response === []
    end

    test "get products when there's one", %{conn: conn} do
      insert_product(@valid_attrs)
      conn = get(conn, @products_url)
      response = json_response(conn, 200)["data"]
      assert length(response) === 1
      assert Map.get(hd(response), "name") === @valid_attrs[:name]
    end
  end
end
