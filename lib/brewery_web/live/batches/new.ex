defmodule BreweryWeb.BatchesLive.New do
  use Phoenix.LiveView

  alias BreweryWeb.BatchesView
  alias BreweryWeb.BatchesLive
  alias BreweryWeb.Router.Helpers, as: Routes
  alias Brewery.Beer
  alias Brewery.Production
  alias Brewery.Production.Batch

  def mount(_params, _session, socket) do
    changeset = Batch.changeset(%Batch{}, %{})
    styles = Beer.list_beer_styles()

    {:ok, assign(socket, changeset: changeset, styles: styles)}
  end

  def render(assigns), do: BatchesView.render("new.html", assigns)

  def handle_event("validate", %{"batch" => attrs}, socket) do
    changeset = Batch.changeset(%Batch{}, attrs)
    |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("save", %{"batch" => attrs}, socket) do
    case Production.create_batch(attrs) do
      {:ok, batch} ->
        {:stop, 
          socket
          |> put_flash(:info, "Batch saved sucessfully!")
          |> redirect(to: Routes.live_path(socket, BatchesLive.Edit, batch))}
      {:error, changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
