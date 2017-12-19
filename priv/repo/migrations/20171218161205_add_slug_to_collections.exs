defmodule CDB.Repo.Migrations.AddSlugToCollections do
  use Ecto.Migration

  def change do
    alter table("collections") do
      add :slug, :string
    end

    create unique_index("collections", :slug)
  end
end
