defmodule BreweryWeb.BatchesView do
  use BreweryWeb, :view

  def format_step("fermentation_start"), do: "Fermentation Start"
  def format_step("dry_hopping"), do: "Dry-Hopping"
  def format_step("maturation_start"), do: "Maturation Start"
  def format_step("bottling"), do: "Bottling"

  def format_date(date) do
    "#{date.month}/#{date.day}/#{date.year}"
  end
end
