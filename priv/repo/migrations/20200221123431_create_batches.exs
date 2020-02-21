defmodule Brewery.Repo.Migrations.CreateBatches do
  use Ecto.Migration

  def change do
    create table(:batches) do
      add :date, :date
      add :notes, :text
      add :original_gravity, :integer
      add :final_gravity, :integer
      add :style_id, references(:beer_styles, on_delete: :nothing)

      timestamps()
    end

    create index(:batches, [:style_id])
  end
end
