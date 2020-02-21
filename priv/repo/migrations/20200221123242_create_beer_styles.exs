defmodule Brewery.Repo.Migrations.CreateBeerStyles do
  use Ecto.Migration

  def change do
    create table(:beer_styles) do
      add :name, :string
      add :bjcp_reference, :string

      timestamps()
    end

  end
end
