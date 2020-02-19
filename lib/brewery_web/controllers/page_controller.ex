defmodule BreweryWeb.PageController do
  use BreweryWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
