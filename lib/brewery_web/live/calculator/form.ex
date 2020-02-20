defmodule BreweryWeb.CalculatorLive.Form do
  alias Ecto.Changeset

  @priming_type_def %{
    num_of_bottles: :integer,
    grams_per_liter: :float,
    bottle_size: :integer
  }

  def change_priming(attrs \\ %{}) do
    {%{}, @priming_type_def}
    |> Changeset.cast(attrs, Map.keys(@priming_type_def))
    |> Changeset.validate_required(Map.keys(@priming_type_def))
  end
end
