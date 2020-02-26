defmodule BreweryWeb.BatchesLive.Edit do
  use Phoenix.LiveView

  alias BreweryWeb.BatchesView
  alias BreweryWeb.BatchesLive
  alias BreweryWeb.Router.Helpers, as: Routes
  alias Brewery.Production
  alias Brewery.Beer
  alias Brewery.Production.Batch

  def mount(%{"id" => id}, _session, socket) do
    batch = Production.get_batch!(id)
    changeset = Production.change_batch(batch)
    styles = Beer.list_beer_styles()

    {:ok, assign(socket, changeset: changeset, batch: batch, styles: styles)}
  end

  def render(assigns), do: BatchesView.render("edit.html", assigns) 

  def handle_event("validate", %{"batch" => attrs}, socket) do
    changeset = Batch.changeset(%Batch{}, attrs)
    |> Map.put(:action, :update)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("save", %{"batch" => attrs}, socket) do
    case Production.update_batch(socket.assigns.batch, attrs) do
      {:ok, batch} -> {:stop,
                       socket 
                       |> put_flash(:info, "Batch updated successfully!")
                       |> redirect(to: Routes.live_path(socket, BatchesLive.List))}
      {:error, changeset} -> assign(socket, changeset: changeset)
    end
  end
end
