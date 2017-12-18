defmodule CDB.Repo.Migrations.CreateCollections do
  use Ecto.Migration

  def change do
    create table(:collections) do
      add :title, :string, null: false
      add :body, :text, null: false
      add :published_at, :utc_datetime

      timestamps()
    end
  end
end
