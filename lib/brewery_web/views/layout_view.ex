defmodule BreweryWeb.LayoutView do
  use BreweryWeb, :view

  @active_class "is-active"

  def nav_active_class(%{request_path: "/batches" <> _rest}, "/batches"), do: @active_class
  def nav_active_class(%{request_path: "/styles" <> _rest}, "/styles"), do: @active_class
  def nav_active_class(%{request_path: "/calculator/priming"}, "/calculator/priming"), do: @active_class
  def nav_active_class(_, _), do: ""
end
