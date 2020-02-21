defmodule Brewery.Beer.BeerStyle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "beer_styles" do
    field :bjcp_reference, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(beer_style, attrs) do
    beer_style
    |> cast(attrs, [:name, :bjcp_reference])
    |> validate_required([:name])
  end
end
