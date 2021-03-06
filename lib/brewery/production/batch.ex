defmodule Brewery.Production.Batch do
  use Ecto.Schema
  import Ecto.Changeset
  alias Brewery.Beer.BeerStyle
  alias Brewery.Production.Step

  schema "batches" do
    field :date, :date
    field :final_gravity, :integer
    field :notes, :string
    field :original_gravity, :integer

    belongs_to :style, BeerStyle
    has_many :steps, Step

    timestamps()
  end

  def abv(original_gravity, final_gravity) do 
    abv = ((original_gravity - final_gravity) * 131.25) / 1000
    Float.round(abv, 1)
  end

  @doc false
  def changeset(batch, attrs) do
    batch
    |> cast(attrs, [:date, :notes, :original_gravity, :final_gravity, :style_id])
    |> validate_required([:date, :notes, :style_id])
    |> foreign_key_constraint(:style_id)
  end
end
