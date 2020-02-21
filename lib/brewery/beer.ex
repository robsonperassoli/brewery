defmodule Brewery.Beer do
  @moduledoc """
  The Beer context.
  """

  import Ecto.Query, warn: false
  alias Brewery.Repo

  alias Brewery.Beer.BeerStyle

  @doc """
  Returns the list of beer_styles.

  ## Examples

      iex> list_beer_styles()
      [%BeerStyle{}, ...]

  """
  def list_beer_styles do
    Repo.all(BeerStyle)
  end

  @doc """
  Gets a single beer_style.

  Raises `Ecto.NoResultsError` if the Beer style does not exist.

  ## Examples

      iex> get_beer_style!(123)
      %BeerStyle{}

      iex> get_beer_style!(456)
      ** (Ecto.NoResultsError)

  """
  def get_beer_style!(id), do: Repo.get!(BeerStyle, id)

  @doc """
  Creates a beer_style.

  ## Examples

      iex> create_beer_style(%{field: value})
      {:ok, %BeerStyle{}}

      iex> create_beer_style(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_beer_style(attrs \\ %{}) do
    %BeerStyle{}
    |> BeerStyle.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a beer_style.

  ## Examples

      iex> update_beer_style(beer_style, %{field: new_value})
      {:ok, %BeerStyle{}}

      iex> update_beer_style(beer_style, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_beer_style(%BeerStyle{} = beer_style, attrs) do
    beer_style
    |> BeerStyle.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a beer_style.

  ## Examples

      iex> delete_beer_style(beer_style)
      {:ok, %BeerStyle{}}

      iex> delete_beer_style(beer_style)
      {:error, %Ecto.Changeset{}}

  """
  def delete_beer_style(%BeerStyle{} = beer_style) do
    Repo.delete(beer_style)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking beer_style changes.

  ## Examples

      iex> change_beer_style(beer_style)
      %Ecto.Changeset{source: %BeerStyle{}}

  """
  def change_beer_style(%BeerStyle{} = beer_style) do
    BeerStyle.changeset(beer_style, %{})
  end
end
