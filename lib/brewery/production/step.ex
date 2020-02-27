defmodule Brewery.Production.Step do
  use Ecto.Schema
  import Ecto.Changeset
  alias Brewery.Production.Batch

  schema "production_step" do
    field :date, :date
    field :notes, :string
    field :type, :string

    belongs_to :batch, Batch

    timestamps()
  end

  @doc false
  def changeset(step, attrs) do
    step
    |> cast(attrs, [:type, :notes, :date, :batch_id])
    |> validate_required([:type, :notes, :date, :batch_id])
    |> validate_inclusion(:type, ["fermentation_start", "dry_hopping", "bottling", "maturation_start"])
  end
end
