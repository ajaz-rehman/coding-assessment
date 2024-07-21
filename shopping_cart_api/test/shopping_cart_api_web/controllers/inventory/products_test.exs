defmodule ShoppingCartApiWeb.InventoryControllerProductsTest do
  use ShoppingCartApiWeb.ConnCase
  alias ShoppingCartApi.Inventory

  @products_url "/api/inventory/products"

  @valid_attrs %{name: "Test Product", description: "A test product", price: 9.99, quantity: 10}

  defp insert_product(attrs) do
    {:ok, product} = Inventory.create_product(attrs)
    product
  end

  defp delete_product(product) do
    {:ok, product} = Inventory.delete_product(product)
    product
  end

  describe "products" do
    test "get products when there's one", %{conn: conn} do
      product = insert_product(@valid_attrs)
      conn = get(conn, @products_url)
      response = json_response(conn, 200)["data"]
      assert length(response) === 1
      assert Map.get(hd(response), "name") === @valid_attrs[:name]
      delete_product(product)
    end

    test "get products when empty", %{conn: conn} do
      conn = get(conn, @products_url)
      response = json_response(conn, 200)["data"]
      assert response === []
    end
  end
end
