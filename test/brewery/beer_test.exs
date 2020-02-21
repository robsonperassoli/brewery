defmodule Brewery.BeerTest do
  use Brewery.DataCase

  alias Brewery.Beer

  describe "beer_styles" do
    alias Brewery.Beer.BeerStyle

    @valid_attrs %{bjcp_reference: "some bjcp_reference", name: "some name"}
    @update_attrs %{bjcp_reference: "some updated bjcp_reference", name: "some updated name"}
    @invalid_attrs %{bjcp_reference: nil, name: nil}

    def beer_style_fixture(attrs \\ %{}) do
      {:ok, beer_style} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Beer.create_beer_style()

      beer_style
    end

    test "list_beer_styles/0 returns all beer_styles" do
      beer_style = beer_style_fixture()
      assert Beer.list_beer_styles() == [beer_style]
    end

    test "get_beer_style!/1 returns the beer_style with given id" do
      beer_style = beer_style_fixture()
      assert Beer.get_beer_style!(beer_style.id) == beer_style
    end

    test "create_beer_style/1 with valid data creates a beer_style" do
      assert {:ok, %BeerStyle{} = beer_style} = Beer.create_beer_style(@valid_attrs)
      assert beer_style.bjcp_reference == "some bjcp_reference"
      assert beer_style.name == "some name"
    end

    test "create_beer_style/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Beer.create_beer_style(@invalid_attrs)
    end

    test "update_beer_style/2 with valid data updates the beer_style" do
      beer_style = beer_style_fixture()
      assert {:ok, %BeerStyle{} = beer_style} = Beer.update_beer_style(beer_style, @update_attrs)
      assert beer_style.bjcp_reference == "some updated bjcp_reference"
      assert beer_style.name == "some updated name"
    end

    test "update_beer_style/2 with invalid data returns error changeset" do
      beer_style = beer_style_fixture()
      assert {:error, %Ecto.Changeset{}} = Beer.update_beer_style(beer_style, @invalid_attrs)
      assert beer_style == Beer.get_beer_style!(beer_style.id)
    end

    test "delete_beer_style/1 deletes the beer_style" do
      beer_style = beer_style_fixture()
      assert {:ok, %BeerStyle{}} = Beer.delete_beer_style(beer_style)
      assert_raise Ecto.NoResultsError, fn -> Beer.get_beer_style!(beer_style.id) end
    end

    test "change_beer_style/1 returns a beer_style changeset" do
      beer_style = beer_style_fixture()
      assert %Ecto.Changeset{} = Beer.change_beer_style(beer_style)
    end
  end
end
