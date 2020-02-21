defmodule BreweryWeb.StylesLive.List do
  use Phoenix.LiveView

  alias BreweryWeb.StylesView
  alias Brewery.Beer

  def fetch() do
    Beer.list_beer_styles
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, list: fetch())}
  end

  def render(assigns), do: StylesView.render("list.html", assigns)

end
