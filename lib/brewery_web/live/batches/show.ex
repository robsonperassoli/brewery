defmodule BreweryWeb.BatchesLive.Show do
  use Phoenix.LiveView
  alias BreweryWeb.BatchesView
  alias Brewery.Production

  def mount(%{"id" => id}, _session, socket) do
    batch = Production.get_batch!(id)

    {:ok, assign(socket, batch: batch)}
  end

  def render(assigns), do: BatchesView.render("show.html", assigns)
end
