defmodule Brewery.ProductionTest do
  use Brewery.DataCase

  alias Brewery.Production

  describe "batches" do
    alias Brewery.Production.Batch

    @valid_attrs %{date: ~D[2010-04-17], final_gravity: 42, notes: "some notes", original_gravity: 42, style_id: 1}
    @update_attrs %{date: ~D[2011-05-18], final_gravity: 43, notes: "some updated notes", original_gravity: 43, style_id: 2}
    @invalid_attrs %{date: nil, final_gravity: nil, notes: nil, original_gravity: nil, style_id: nil}

    def batch_fixture(attrs \\ %{}) do
      {:ok, batch} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Production.create_batch()

      batch
    end

    test "list_batches/0 returns all batches" do
      batch = batch_fixture()
      assert Production.list_batches() == [batch]
    end

    test "get_batch!/1 returns the batch with given id" do
      batch = batch_fixture()
      assert Production.get_batch!(batch.id) == batch
    end

    test "create_batch/1 with valid data creates a batch" do
      assert {:ok, %Batch{} = batch} = Production.create_batch(@valid_attrs)
      assert batch.date == ~D[2010-04-17]
      assert batch.final_gravity == 42
      assert batch.notes == "some notes"
      assert batch.original_gravity == 42
    end

    test "create_batch/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Production.create_batch(@invalid_attrs)
    end

    test "update_batch/2 with valid data updates the batch" do
      batch = batch_fixture()
      assert {:ok, %Batch{} = batch} = Production.update_batch(batch, @update_attrs)
      assert batch.date == ~D[2011-05-18]
      assert batch.final_gravity == 43
      assert batch.notes == "some updated notes"
      assert batch.original_gravity == 43
    end

    test "update_batch/2 with invalid data returns error changeset" do
      batch = batch_fixture()
      assert {:error, %Ecto.Changeset{}} = Production.update_batch(batch, @invalid_attrs)
      assert batch == Production.get_batch!(batch.id)
    end

    test "delete_batch/1 deletes the batch" do
      batch = batch_fixture()
      assert {:ok, %Batch{}} = Production.delete_batch(batch)
      assert_raise Ecto.NoResultsError, fn -> Production.get_batch!(batch.id) end
    end

    test "change_batch/1 returns a batch changeset" do
      batch = batch_fixture()
      assert %Ecto.Changeset{} = Production.change_batch(batch)
    end
  end

  describe "production_step" do
    alias Brewery.Production.Step

    @valid_attrs %{date: ~D[2010-04-17], notes: "some notes", type: "some type"}
    @update_attrs %{date: ~D[2011-05-18], notes: "some updated notes", type: "some updated type"}
    @invalid_attrs %{date: nil, notes: nil, type: nil}

    def step_fixture(attrs \\ %{}) do
      {:ok, step} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Production.create_step()

      step
    end

    test "list_production_step/0 returns all production_step" do
      step = step_fixture()
      assert Production.list_production_step() == [step]
    end

    test "get_step!/1 returns the step with given id" do
      step = step_fixture()
      assert Production.get_step!(step.id) == step
    end

    test "create_step/1 with valid data creates a step" do
      assert {:ok, %Step{} = step} = Production.create_step(@valid_attrs)
      assert step.date == ~D[2010-04-17]
      assert step.notes == "some notes"
      assert step.type == "some type"
    end

    test "create_step/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Production.create_step(@invalid_attrs)
    end

    test "update_step/2 with valid data updates the step" do
      step = step_fixture()
      assert {:ok, %Step{} = step} = Production.update_step(step, @update_attrs)
      assert step.date == ~D[2011-05-18]
      assert step.notes == "some updated notes"
      assert step.type == "some updated type"
    end

    test "update_step/2 with invalid data returns error changeset" do
      step = step_fixture()
      assert {:error, %Ecto.Changeset{}} = Production.update_step(step, @invalid_attrs)
      assert step == Production.get_step!(step.id)
    end

    test "delete_step/1 deletes the step" do
      step = step_fixture()
      assert {:ok, %Step{}} = Production.delete_step(step)
      assert_raise Ecto.NoResultsError, fn -> Production.get_step!(step.id) end
    end

    test "change_step/1 returns a step changeset" do
      step = step_fixture()
      assert %Ecto.Changeset{} = Production.change_step(step)
    end
  end
end
