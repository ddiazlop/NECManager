defmodule NecmanagerWeb.NectableLive do
  use NecmanagerWeb, :live_view

  import NecmanagerWeb.CharacterUtils

  @topic "selected_character"

  def mount(_params, _session, socket) do
    NecmanagerWeb.Endpoint.subscribe(@topic)

    players = ["Tagons", "Hug", "Jytami", "Seles"]

    characters = get_characters([])

    {:ok,
     assign(socket,
       characters: characters,
       players: players
     )}
  end

  def handle_event("inc_temperature", _params, socket) do
    {:noreply, update(socket, :temperature, &(&1 + 1))}
  end

  def handle_info(%{topic: @topic, payload: payload}, socket) do
    IO.puts("Received payload: #{inspect(payload)}")
    send_update PlayerRowLiveComponent, id: "row-#{payload.username}", selected_character: payload.character
    {:noreply, socket}
  end
end
