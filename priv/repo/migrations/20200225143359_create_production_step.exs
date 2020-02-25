defmodule Brewery.Repo.Migrations.CreateProductionStep do
  use Ecto.Migration

  def change do
    create table(:production_step) do
      add :type, :string
      add :notes, :string
      add :date, :date
      add :batch_id, references(:batches, on_delete: :nothing)

      timestamps()
    end

    create index(:production_step, [:batch_id])
  end
end
