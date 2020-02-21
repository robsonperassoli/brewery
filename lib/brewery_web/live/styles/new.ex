defmodule BreweryWeb.StylesLive.New do
  use Phoenix.LiveView

  alias BreweryWeb.StylesView
  alias BreweryWeb.StylesLive
  alias BreweryWeb.Router.Helpers, as: Routes
  alias Brewery.Beer
  alias Brewery.Beer.BeerStyle

  def mount(_params, _session, socket) do
    changeset = BeerStyle.changeset(%BeerStyle{}, %{})

    {:ok, assign(socket, changeset: changeset)}
  end

  def render(assigns), do: StylesView.render("new.html", assigns)

  def handle_event("validate", %{"beer_style"=> attrs}, socket) do
    changeset = BeerStyle.changeset(%BeerStyle{}, attrs)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("save", %{"beer_style" => attrs}, socket) do
    case Beer.create_beer_style(attrs) do
      {:ok, beer_style} ->
        {:stop,
         socket
         |> put_flash(:info, "Style created successfully!")
         |> redirect(to: Routes.live_path(socket, StylesLive.Show, beer_style))}
      {:error, changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
