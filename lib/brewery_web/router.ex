defmodule BreweryWeb.Router do
  use BreweryWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BreweryWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/test", TestLive
    live "/calculator/priming", CalculatorLive.Priming
    live "/styles", StylesLive.List
    live "/styles/new", StylesLive.New
    live "/styles/:id", StylesLive.Show
    live "/styles/:id/edit", StylesLive.Edit
    live "/batches/new", BatchesLive.New
    live "/batches", BatchesLive.List
    live "/batches/:id", BatchesLive.Show
    live "/batches/:id/edit", BatchesLive.Edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", BreweryWeb do
  #   pipe_through :api
  # end
end
