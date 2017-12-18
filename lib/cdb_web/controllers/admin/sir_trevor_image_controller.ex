defmodule CDBWeb.Admin.SirTrevorImageController do
  use CDBWeb, :controller
  alias CDB.SirTrevorImages

  def create(conn, %{"attachment" => image_params}) do
    case format_image_params(image_params) |> SirTrevorImages.create_sir_trevor_image() do
      {:ok, image} -> render(conn, "image.json", image: image)
    end
  end

  defp format_image_params(%{"file" => file}), do: %{image: format_filename(file)}
  defp format_image_params(_image_params), do: %{}

  defp format_filename(%Plug.Upload{} = file) do
    extname = Map.fetch!(file, :filename) |> Path.extname
    filename = UUID.uuid1() <> extname
    %Plug.Upload{file | filename: filename}
  end
  defp format_filename(_file), do: %{}
end
