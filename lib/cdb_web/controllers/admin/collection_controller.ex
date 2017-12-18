defmodule CDBWeb.Admin.CollectionController do
  use CDBWeb, :controller
  alias CDB.Collections
  alias CDB.Collections.Collection

  def index(conn, _params) do
    collections = Collections.list_collections()
    render(conn, "index.html", collections: collections)
  end

  def new(conn, _params) do
    changeset = Collections.change_collection(%Collection{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"collection" => collection_params}) do
    case Collections.create_collection(collection_params) do
      {:ok, _collection} ->
        conn
        |> put_flash(:info, "Collection created successfully.")
        |> redirect(to: admin_collection_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    collection = Collections.get_collection!(id)
    changeset = Collections.change_collection(collection)
    render(conn, "edit.html", collection: collection, changeset: changeset)
  end

  def update(conn, %{"id" => id, "collection" => collection_params}) do
    collection = Collections.get_collection!(id)
    case Collections.update_collection(collection, collection_params) do
      {:ok, _collection} ->
        conn
        |> put_flash(:info, "Collection updated successfully.")
        |> redirect(to: admin_collection_path(conn, :index))
      {:error, changeset} ->
        render(conn, "edit.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    collection = Collections.get_collection!(id)
    case Collections.delete_collection(collection) do
      {:ok, _collection} ->
        conn
        |> put_flash(:info, "Collection deleted successfully.")
        |> redirect(to: admin_collection_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Failed to delete collection")
        |> redirect(to: admin_collection_path(conn, :index))
    end
  end
end
