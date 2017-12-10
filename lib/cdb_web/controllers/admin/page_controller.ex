defmodule CdbWeb.Admin.PageController do
  use CdbWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
