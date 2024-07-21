defmodule ShoppingCartApiWeb.InventoryControllerConfirmPurchaseTest do
  use ShoppingCartApiWeb.ConnCase
  alias ShoppingCartApi.Inventory

  @base_url "/api/inventory/confirm_purchase"

  @empty_args %{
    "items" => []
  }

  @invalid_args %{
    "items" => [
      %{"product_id" => 1, "quantity" => 0}
    ]
  }

  @missing_args %{
    "items" => [
      %{"product_id" => 1}
    ]
  }

  @valid_args %{
    "items" => [
      %{"product_id" => 1, "quantity" => 1}
    ]
  }

  @valid_products [
    %{name: "Test Product", description: "A test product", price: 9.99, quantity: 10},
    %{name: "Test Product 2", description: "Another test product", price: 19.99, quantity: 5}
  ]

  def insert_products(products) do
    inserts = Enum.map(products, &Inventory.create_product(&1))
    Enum.map(inserts, fn {:ok, product} -> product end)
  end

  def get_products() do
    Inventory.list_products()
  end

  defp get_valid_args(products, quantity \\ 1) do
    items = Enum.map(products, fn product ->
      %{"product_id" => product.id, "quantity" => quantity}
    end)

    %{items: items}
  end

  describe "confirm_purchase" do
    test "no arguments", %{conn: conn} do
      conn = post(conn, @base_url, @empty_args)
      response = json_response(conn, 400)
      assert Map.has_key?(response, "error")
    end

    test "missing arguments", %{conn: conn} do
      conn = post(conn, @base_url, @missing_args)
      response = json_response(conn, 400)
      assert Map.has_key?(response, "error")
    end

    test "products not in database", %{conn: conn} do
      conn = post(conn, @base_url, @valid_args)
      response = json_response(conn, 404)
      assert Map.has_key?(response, "error")
    end

    test "products in database but invalid args", %{conn: conn} do
      products = insert_products(@valid_products)
      conn = post(conn, @base_url, @invalid_args)
      response = json_response(conn, 400)
      assert Map.has_key?(response, "error")
    end

    test "products in database and valid args", %{conn: conn} do
      products = insert_products(@valid_products)
      valid_args = get_valid_args(products)
      conn = post(conn, @base_url, valid_args)
      response = json_response(conn, 200)
      assert Map.has_key?(response, "message")
    end

    test "products in database but not enough quantity", %{conn: conn} do
      products = insert_products(@valid_products)
      valid_args = get_valid_args(products, 1000)
      conn = post(conn, @base_url, valid_args)
      response = json_response(conn, 403)
      assert Map.has_key?(response, "error")
    end
  end
end
