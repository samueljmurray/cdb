defmodule CDBWeb.CollectionController do
  use CDBWeb, :controller
  alias CDB.Collections

  plug :assign_collections

  def home(conn, _params) do
    collection = Collections.get_latest_published_collection!()
    collection_body = Poison.decode!(collection.body)
    render(conn, "show.html", collection: collection, collection_body: collection_body)
  end

  def show(conn, %{"slug" => slug}) do
    collection = Collections.get_published_collection_by_slug!(slug)
    collection_body = Poison.decode!(collection.body)
    render(conn, "show.html", collection: collection, collection_body: collection_body)
  end

  def assign_collections(conn, _params) do
    collections = Collections.list_published_collections()
    assign(conn, :collections, collections)
  end
end
