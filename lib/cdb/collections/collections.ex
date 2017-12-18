defmodule CDB.Collections do
  import Ecto.Query, warn: false
  alias CDB.Repo
  alias CDB.Collections.Collection

  def list_collections() do
    Collection
    |> Collection.query_order_unpublished_published()
    |> Repo.all
  end

  def get_collection!(id) do
    Repo.get!(Collection, id)
  end
  
  def list_published_collections() do
    Collection
    |> Collection.query_published
    |> Repo.all
  end

  def create_collection(collection_params) do
    %Collection{}
    |> Collection.changeset(collection_params)
    |> Repo.insert
  end

  def update_collection(collection, collection_params) do
    collection
    |> Collection.changeset(collection_params)
    |> Repo.update
  end

  def delete_collection(collection) do
    Repo.delete(collection)
  end

  def change_collection(%Collection{} = collection) do
    Collection.changeset(collection, %{})
  end
end