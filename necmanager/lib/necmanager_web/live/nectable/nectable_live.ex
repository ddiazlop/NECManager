defmodule NecmanagerWeb.NectableLive do
  use NecmanagerWeb, :live_view

  def mount(_params, _session, socket) do
    players = ["Tagons", "Hug", "Jytami", "Seles"]

    characters =
      Path.wildcard("priv/static/images/characters/*.svg")
      |> Enum.map(fn path -> String.replace(path, "priv/static/", "") end)

    {:ok,
     assign(socket,
       characters: characters,
       players: players
     )}
  end

  def handle_event("inc_temperature", _params, socket) do
    {:noreply, update(socket, :temperature, &(&1 + 1))}
  end
end
