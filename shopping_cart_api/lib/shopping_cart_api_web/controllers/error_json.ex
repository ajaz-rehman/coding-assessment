defmodule ShoppingCartApiWeb.ErrorJSON do
  def render("error.json", %{reason: %Ecto.NoResultsError{}}) do
    %{errors: %{detail: "Resource not found"}}
  end

  def render("error.json", %{reason: %Ecto.InvalidChangesetError{} = error}) do
    %{errors: Ecto.Changeset.traverse_errors(error.changeset, &translate_error/1)}
  end

  def render("error.json", %{reason: error}) when is_binary(error) do
    %{errors: %{detail: error}}
  end

  def render("error.json", %{reason: _}) do
    %{errors: %{detail: "Internal server error"}}
  end

  # Keep the default clause for status code templates
  def render(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  defp translate_error({msg, opts}) do
    Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", to_string(value))
    end)
  end
end
