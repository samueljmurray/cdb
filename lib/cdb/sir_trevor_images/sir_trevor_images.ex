defmodule CDB.SirTrevorImages do
  import Ecto.Query, warn: false
  alias CDB.Repo
  alias CDB.SirTrevorImages.SirTrevorImage

  def create_sir_trevor_image(image_params) do
    %SirTrevorImage{}
    |> SirTrevorImage.changeset(image_params)
    |> Repo.insert
  end
end