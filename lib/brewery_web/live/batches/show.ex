defmodule BreweryWeb.BatchesLive.Show do
  use Phoenix.LiveView
  alias BreweryWeb.BatchesView
  alias Brewery.Production
  alias Brewery.Repo

  def mount(%{"id" => id}, _session, socket) do
    batch = Production.get_batch!(id)
    |> Repo.preload(:style)

    {:ok, assign(socket, batch: batch)}
  end

  def render(assigns), do: BatchesView.render("show.html", assigns)
end
