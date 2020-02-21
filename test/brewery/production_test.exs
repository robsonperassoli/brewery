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
end
