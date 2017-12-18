defmodule CdbWeb.Router do
  use CdbWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :admin do
    plug BasicAuth, use_config: {:cdb, :credentials}
    plug :put_layout, {CdbWeb.LayoutView, :admin}
  end

  scope "/admin", CdbWeb.Admin do
    pipe_through :browser
    pipe_through :admin

    get "/", PageController, :index
  end

  scope "/", CdbWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", CdbWeb do
  #   pipe_through :api
  # end
end
