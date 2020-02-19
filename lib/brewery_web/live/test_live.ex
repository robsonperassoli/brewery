defmodule BreweryWeb.TestLive do
  use Phoenix.LiveView

  def mount(_session, socket) do
    {:ok, assign(socket, text: "")}
  end

  def render(assigns) do
    ~L"""
    <h1>HEEEEEYYYYOOOOO</h1>
    <div phx-window-keydown="keydown">
      <%= @text %>
    </div>
    """
  end

  def handle_event("keydown", %{"key" => key}, socket) do
    {:noreply, assign(socket, text: "#{socket.assigns.text}#{key}")}
  end
end
