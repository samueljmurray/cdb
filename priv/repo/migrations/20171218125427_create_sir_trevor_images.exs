defmodule CDB.Repo.Migrations.CreateSirTrevorImages do
  use Ecto.Migration

  def change do
    create table(:sir_trevor_images) do
      add :image, :string, null: false

      timestamps()
    end
  end
end
