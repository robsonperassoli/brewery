defmodule BreweryWeb.BatchesLive.List do
  use Phoenix.LiveView
  alias BreweryWeb.BatchesView
  alias Brewery.Production

  def mount(_params, _session, socket) do
    list = Production.list_batches()

    {:ok, assign(socket, list: list)}
  end

  def render(assigns), do: BatchesView.render("list.html", assigns)
end
