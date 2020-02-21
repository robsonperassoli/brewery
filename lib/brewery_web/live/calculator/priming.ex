defmodule BreweryWeb.CalculatorLive.Priming do
  use Phoenix.LiveView

  alias BreweryWeb.CalculatorView
  alias BreweryWeb.CalculatorLive.Form

  def calc_priming(%{valid?: false}), do:  nil
  def calc_priming(%{valid?: true} = changeset) do
    %{
      num_of_bottles: num_of_bottles,
      grams_per_liter: grams_per_liter,
      bottle_size: bottle_size
    } = changeset.changes

    Atomic.Priming.priming_for(num_of_bottles, grams_per_liter, bottle_size)
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, changeset: Form.change_priming(), results: nil)}
  end

  def render(assigns), do: CalculatorView.render("priming.html", assigns)

  def handle_event("calculate", %{"priming" => params}, socket) do
    changeset = Form.change_priming(params)
    |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset, results: calc_priming(changeset))}
  end
end
