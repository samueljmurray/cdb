defmodule CDB.SirTrevorImages.SirTrevorImage do
  import Ecto.Changeset
  import Ecto.Query, warn: false
  use Ecto.Schema
  use Arc.Ecto.Schema

  schema "sir_trevor_images" do
    field :image, CDB.SirTrevorImageUploader.Type

    timestamps()
  end

  def changeset(%__MODULE__{} = sir_trevor_image, attrs \\ %{}) do
    sir_trevor_image
    |> cast(attrs, [:image])
    |> cast_attachments(attrs, [:image])
    |> validate_required([:image])
  end
end
