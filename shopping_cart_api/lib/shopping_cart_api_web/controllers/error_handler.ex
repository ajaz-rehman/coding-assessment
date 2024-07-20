defmodule ShoppingCartApiWeb.ErrorHandler do
  use ShoppingCartApiWeb, :controller

  def call(conn, {:error, reason}) do
    conn
    |> put_status(status_code_for_error(reason))
    |> put_view(ShoppingCartApiWeb.ErrorJSON)
    |> render("error.json", %{reason: reason})
  end

  defp status_code_for_error(%Ecto.NoResultsError{}), do: :not_found
  defp status_code_for_error(%Ecto.InvalidChangesetError{}), do: :unprocessable_entity
  defp status_code_for_error(_), do: :internal_server_error
end
