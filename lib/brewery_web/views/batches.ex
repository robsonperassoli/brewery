defmodule BreweryWeb.BatchesView do
  use BreweryWeb, :view
  
  alias Brewery.Production.Batch

  def format_step("fermentation_start"), do: "Fermentation Start"
  def format_step("dry_hopping"), do: "Dry-Hopping"
  def format_step("maturation_start"), do: "Maturation Start"
  def format_step("bottling"), do: "Bottling"

  def format_date(date) do
    "#{date.month}/#{date.day}/#{date.year}"
  end

  def abv(%Batch{original_gravity: original_gravity, final_gravity: final_gravity}) when original_gravity == nil or final_gravity == nil, do: ""
  def abv(%Batch{original_gravity: original_gravity, final_gravity: final_gravity}), do: "#{Batch.abv(original_gravity, final_gravity)} %"
end
