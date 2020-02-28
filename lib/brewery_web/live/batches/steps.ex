defmodule BreweryWeb.BatchesLive.Steps do
  use Phoenix.LiveView
  alias BreweryWeb.BatchesView
  alias Brewery.Production
  alias Brewery.Production.Batch
  alias Brewery.Production.Step

  def mount(%{"id" => id}, _session, socket) do
    batch = Production.get_batch!(id)
    steps = fetch_steps(batch)

    {:ok, assign(socket, batch: batch, changeset: create_changeset(), steps: steps)}
  end

  def render(assigns), do: BatchesView.render("steps.html", assigns)

  def handle_event("validate", %{"step" => attrs}, socket) do
    changeset = Step.changeset(%Step{}, attrs)
    |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("save", %{"step" => attrs}, socket) do
    case Production.create_step(attrs) do
      {:ok, step} -> 
        {:noreply, assign(socket, changeset: create_changeset(), steps: fetch_steps(socket.assigns.batch))}
      {:error, changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  def handle_event("delete", %{"step-id" => step_id}, socket) do
    step = Production.get_step!(step_id)
    case Production.delete_step(step) do
      {:ok, _} ->
        {:noreply, assign(socket, steps: fetch_steps(socket.assigns.batch))}
      {:error, _} ->
        {:noreply, put_flash(socket, :error, "Error removing the step!")}
    end
  end

  def create_changeset(), do: Production.change_step(%Step{})

  def fetch_steps(%Batch{id: batch_id}) do
    Production.list_production_step(batch_id)
  end
end
