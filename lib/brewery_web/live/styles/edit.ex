defmodule BreweryWeb.StylesLive.Edit do
  use Phoenix.LiveView

  alias BreweryWeb.StylesView
  alias BreweryWeb.StylesLive
  alias BreweryWeb.Router.Helpers, as: Routes
  alias Brewery.Beer
  alias Brewery.Beer.BeerStyle

  def mount(%{"id" => id}, _session, socket) do
    beer_style = Beer.get_beer_style!(id)
    changeset = Beer.change_beer_style(beer_style)

    {:ok, assign(socket, beer_style: beer_style, changeset: changeset)}
  end

  def render(assigns), do: StylesView.render("edit.html", assigns)

  def handle_event("validate", %{"beer_style" => attrs}, socket) do
    changeset = socket.assigns.beer_style
    |> BeerStyle.changeset(attrs)
    |> Map.put(:action, :update)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("save", %{"beer_style" => attrs}, socket) do
    case Beer.update_beer_style(socket.assigns.beer_style, attrs) do
      {:ok, beer_style} ->
        {:stop,
          socket
          |> put_flash(:info, "Style updated successfully!")
          |> redirect(to: Routes.live_path(socket, StylesLive.Show, beer_style))}
      {:error, changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
