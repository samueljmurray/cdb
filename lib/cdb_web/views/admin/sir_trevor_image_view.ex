defmodule CDBWeb.Admin.SirTrevorImageView do
  use CDBWeb, :view
  alias CDB.SirTrevorImageUploader

  def render("image.json", %{image: image}) do
    %{
      file: render_urls(image),
      id: image.id
    }
  end

  defp render_urls(image) do
    Map.new
    |> Map.put(:url, SirTrevorImageUploader.url({image.image, image}, :web))
    |> Map.put(:image, %{
       "web" => SirTrevorImageUploader.url({image.image, image}, :web)
    })
  end
end
