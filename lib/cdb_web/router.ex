defmodule CDBWeb.Router do
  use CDBWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    #plug BasicAuth, use_config: {:cdb, :credentials}
  end

  pipeline :admin do
    plug :put_layout, {CDBWeb.LayoutView, :admin}
  end

  scope "/admin", CDBWeb.Admin, as: :admin do
    pipe_through :browser
    pipe_through :admin

    get "/", CollectionController, :index
    resources "/collections", CollectionController
    post "/images", SirTrevorImageController, :create
  end

  scope "/", CDBWeb do
    pipe_through :browser

    get "/", CollectionController, :home
    get "/collection/:slug", CollectionController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", CDBWeb do
  #   pipe_through :api
  # end
end
