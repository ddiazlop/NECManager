defmodule NecmanagerWeb.NectableLive do
  use NecmanagerWeb, :live_view

  def mount(_params, _session, socket) do
    players = ["Tagons", "Hug", "Jytami", "Seles"]

    {:ok,
     assign(socket,
       characters: Path.wildcard("priv/static/images/characters/*.svg"),
       players: players
     )}
  end

  def handle_event("inc_temperature", _params, socket) do
    {:noreply, update(socket, :temperature, &(&1 + 1))}
  end
end
