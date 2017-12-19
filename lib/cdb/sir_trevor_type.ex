defmodule CDB.SirTrevorType do
  # The beginnings of a sir trevor Ecto type
  # Includes sanitization of a custom Sir Trevor block (image with link)
  @behaviour Ecto.Type
  def type, do: :string

  def cast(string) when is_binary(string) do
    case Poison.decode(string) do
      {:ok, %{"data" => data}} ->
        {
          :ok,
          Map.new()
          |> Map.put("data", Enum.map(data, &sanitize_block(&1)))
          |> Poison.encode!()
        }
      _ -> :error
    end
  end
  def cast(_), do: :error

  def load(string) when is_binary(string), do: {:ok, string}
  def load(_), do: :error

  def dump(string) when is_binary(string), do: {:ok, string}
  def dump(_), do: :error

  defp sanitize_block(block = %{"type" => "image", "data" => %{"link_url" => link_url}}) do
    replacement_link_url =
      link_url
      |> HtmlSanitizeEx.strip_tags
      |> HtmlEntities.decode
    put_in(block, ["data", "link_url"], replacement_link_url)
  end
  defp sanitize_block(block), do: block
end