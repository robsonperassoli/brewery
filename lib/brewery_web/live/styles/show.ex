defmodule BreweryWeb.StylesLive.Show do
  use Phoenix.LiveView

  alias BreweryWeb.StylesView
  alias Brewery.Beer

  def mount(%{"id" => id}, _session, socket) do
    beer_style = Beer.get_beer_style!(id)

    {:ok, assign(socket, beer_style: beer_style)}
  end

  def render(assigns), do: StylesView.render("show.html", assigns)
end
