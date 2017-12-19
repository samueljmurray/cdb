defmodule CDB.Collections.Collection do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias CDB.Collections.Collection.TitleSlug

  schema "collections" do
    field :title, :string
    field :body, CDB.SirTrevorType
    field :published_at, :utc_datetime
    field :published, :boolean, virtual: true
    field :slug, TitleSlug.Type

    timestamps()
  end

  def changeset(%__MODULE__{} = collection, attrs \\ %{}) do
    collection
    |> cast(attrs, [:title, :body, :published])
    |> validate_required([:title, :body])
    |> put_published_at(collection)
    |> TitleSlug.maybe_generate_slug()
    |> TitleSlug.unique_constraint()
  end

  def query_published(query) do
    from c in query,
      where: not is_nil(c.published_at)
  end

  def query_order_published(query) do
    from c in query,
      order_by: [desc: c.published_at]
  end

  def query_order_unpublished_published(query) do
    from c in query,
      order_by: [desc: is_nil(c.published_at)],
      order_by: [desc: c.published_at],
      order_by: [desc: c.updated_at]
  end

  def put_published_at(%Ecto.Changeset{changes: %{published: true}} = changeset, %__MODULE__{published_at: nil}) do
    published_at = Ecto.DateTime.cast!(Timex.local)
    put_change(changeset, :published_at, published_at)
  end
  def put_published_at(%Ecto.Changeset{changes: %{published: false}} = changeset, %__MODULE__{published_at: published_at})
  when not is_nil(published_at) do
    put_change(changeset, :published_at, nil)
  end
  def put_published_at(changeset, _collection), do: changeset
end
